import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/seer/seer_models.dart';
import '../../utils/app_logger.dart';

/// Seer (Jellyseerr/Overseerr) API client.
///
/// Handles cookie-based session auth and CSRF tokens. The base URL is
/// dynamic (set per-session) and cookies are managed in-memory.
class SeerClient {
  String? _baseUrl;
  String? _cookie;
  String? _xsrfToken;
  final http.Client _httpClient;

  SeerClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  void configure({required String baseUrl, String? cookie}) {
    _baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    _cookie = cookie;
    // Always reset XSRF on reconfigure — a stale token from a previous
    // session causes 403s.
    _xsrfToken = null;
    appLogger.i('Seer: configured with baseUrl=$_baseUrl, hasCookie=${cookie != null}');
  }

  void clearSession() {
    _baseUrl = null;
    _cookie = null;
    _xsrfToken = null;
  }

  bool get isConfigured => _baseUrl != null;
  String get baseUrl => _baseUrl ?? '';

  /// Verify a server is reachable (static — no session needed).
  static Future<bool> verifyServer(String url) async {
    final cleanUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
    final candidates = <String>[];
    if (cleanUrl.startsWith('http://') || cleanUrl.startsWith('https://')) {
      candidates.add(cleanUrl);
    } else {
      candidates.add('https://$cleanUrl');
      candidates.add('http://$cleanUrl');
    }

    for (final candidate in candidates) {
      try {
        final response = await http
            .get(Uri.parse('$candidate/api/v1/status'))
            .timeout(const Duration(seconds: 5));
        appLogger.i('Seer verifyServer: $candidate → ${response.statusCode}');
        if (response.statusCode == 200) return true;
      } catch (e) {
        appLogger.w('Seer verifyServer: $candidate failed: $e');
      }
    }
    return false;
  }

  Map<String, String> _buildHeaders({bool includeXsrf = true, Map<String, String>? extra}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    // Build the full cookie header (session + XSRF-TOKEN)
    final cookieHeader = _buildCookieHeader();
    if (cookieHeader.isNotEmpty) {
      headers['Cookie'] = cookieHeader;
    }
    // Only send XSRF-TOKEN header on mutating requests, not GETs.
    if (includeXsrf && _xsrfToken != null && _xsrfToken!.isNotEmpty) {
      headers['XSRF-TOKEN'] = _xsrfToken!;
    }
    if (extra != null) headers.addAll(extra);
    return headers;
  }

  /// Seed the XSRF token by doing a GET to the base URL.
  Future<void> _ensureXsrfToken() async {
    if (_xsrfToken != null) return;
    if (_baseUrl == null) return;

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/v1/status'),
        headers: _cookie != null ? {'Cookie': _cookie!} : {},
      );
      _processAllSetCookies(response);
    } catch (e) {
      appLogger.w('Seer: failed to seed XSRF token: $e');
    }
  }

  void _processAllSetCookies(http.Response response) {
    // The http package collapses multiple set-cookie headers into one
    // comma-separated string. Parse all cookies from it.
    final setCookie = response.headers['set-cookie'];
    if (setCookie == null) return;

    // Split by comma followed by a cookie name pattern (heuristic — works for
    // most cases since cookie names don't contain commas)
    final cookies = <String>[];
    final parts = setCookie.split(', ');
    String current = '';
    for (final part in parts) {
      if (part.contains('=') && !part.startsWith(' ')) {
        if (current.isNotEmpty) cookies.add(current);
        current = part;
      } else {
        current = current.isEmpty ? part : '$current, $part';
      }
    }
    if (current.isNotEmpty) cookies.add(current);

    // Also try the raw split (some servers don't comma-separate)
    if (cookies.isEmpty) cookies.add(setCookie);

    for (final cookie in cookies) {
      _processSingleSetCookie(cookie);
    }
  }

  void _processSingleSetCookie(String rawCookie) {
    final parts = rawCookie.split(';');
    for (final part in parts) {
      final trimmed = part.trim();
      // Jellyseerr/Overseerr use 'connect.sid' as the session cookie name
      // (Express session default). Older versions used 'session'.
      if (trimmed.startsWith('connect.sid=') || trimmed.startsWith('session=')) {
        // Store the full cookie pair (name=value) so it can be sent back
        _cookie = trimmed;
      } else if (trimmed.startsWith('XSRF-TOKEN=')) {
        _xsrfToken = trimmed.substring('XSRF-TOKEN='.length);
        // URL-decode the token (Jellyseerr encodes it in the cookie)
        try {
          _xsrfToken = Uri.decodeComponent(_xsrfToken!);
        } catch (_) {}
      }
    }
  }

  Future<http.Response> _request(
    String method,
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    if (_baseUrl == null) {
      throw Exception('Seer server URL not configured');
    }

    final uri = Uri.parse('$_baseUrl/api/v1/$path').replace(queryParameters: queryParams);

    // Seed XSRF token for mutating requests
    if (method != 'GET' && _xsrfToken == null) {
      await _ensureXsrfToken();
    }

    final headers = _buildHeaders(includeXsrf: method != 'GET');
    final requestBody = body != null ? jsonEncode(body) : null;

    appLogger.d('Seer $method $uri (cookie: ${_cookie != null ? "yes" : "no"}, xsrf: ${_xsrfToken != null ? "yes" : "no"})');

    final response = await _httpClient.send(
      http.Request(method, uri)
        ..headers.addAll(headers)
        ..body = requestBody ?? '',
    ).then(http.Response.fromStream);

    _processAllSetCookies(response);

    appLogger.d('Seer $method $path → ${response.statusCode}');

    // On 403 for mutating requests, try re-seeding XSRF and retry once
    if (response.statusCode == 403 && method != 'GET') {
      appLogger.w('Seer: 403 on $method — re-seeding XSRF and retrying');
      _xsrfToken = null;
      await _ensureXsrfToken();
      if (_xsrfToken != null) {
        final retryHeaders = _buildHeaders(includeXsrf: true);
        final retryResponse = await _httpClient.send(
          http.Request(method, uri)
            ..headers.addAll(retryHeaders)
            ..body = requestBody ?? '',
        ).then(http.Response.fromStream);
        _processAllSetCookies(retryResponse);
        appLogger.d('Seer retry $method $path → ${retryResponse.statusCode}');
        return retryResponse;
      }
    }

    return response;
  }

  // ─── Auth ───

  Future<(SeerUser, String)> loginJellyfin(String username, String password) async {
    final response = await _request('POST', 'auth/jellyfin',
        body: {'username': username, 'password': password});
    if (response.statusCode != 200) {
      throw Exception('Login failed: ${response.statusCode} ${response.body}');
    }
    _processAllSetCookies(response);
    final cookie = _buildCookieHeader();
    final user = SeerUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return (user, cookie);
  }

  Future<(SeerUser, String)> loginLocal(String email, String password) async {
    final response = await _request('POST', 'auth/local',
        body: {'email': email, 'password': password});
    if (response.statusCode != 200) {
      throw Exception('Login failed: ${response.statusCode} ${response.body}');
    }
    _processAllSetCookies(response);
    final cookie = _buildCookieHeader();
    final user = SeerUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return (user, cookie);
  }

  /// Build the full Cookie header from all stored cookies.
  /// When we get the session cookie from login, we also need to send the
  /// XSRF-TOKEN cookie (not just the header) so the server validates the CSRF.
  String _buildCookieHeader() {
    final parts = <String>[];
    if (_cookie != null && _cookie!.isNotEmpty) parts.add(_cookie!);
    if (_xsrfToken != null && _xsrfToken!.isNotEmpty) {
      parts.add('XSRF-TOKEN=${Uri.encodeComponent(_xsrfToken!)}');
    }
    return parts.join('; ');
  }

  Future<SeerUser> getCurrentUser() async {
    final response = await _request('GET', 'auth/me');
    if (response.statusCode != 200) {
      throw Exception('Failed to get current user: ${response.statusCode}');
    }
    return SeerUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> logout() async {
    try {
      await _request('POST', 'auth/logout');
    } catch (_) {}
    clearSession();
  }

  // ─── Requests ───

  Future<SeerRequest> createRequest({
    required int mediaId,
    required SeerMediaType mediaType,
    List<int>? seasons,
    bool is4k = false,
    int? serverId,
    int? profileId,
    String? rootFolder,
  }) async {
    final response = await _request('POST', 'request', body: {
      'mediaType': mediaType.apiString,
      'mediaId': mediaId,
      if (seasons != null) 'seasons': seasons,
      'is4k': is4k,
      if (serverId != null) 'serverId': serverId,
      if (profileId != null) 'profileId': profileId,
      if (rootFolder != null) 'rootFolder': rootFolder,
    });
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Failed to create request: ${response.statusCode} ${response.body}');
    }
    final created = SeerRequest.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return getRequest(created.id);
  }

  Future<SeerRequest> getRequest(int id) async {
    final response = await _request('GET', 'request/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to get request: ${response.statusCode}');
    }
    return SeerRequest.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<List<SeerRequest>> getRequests({
    int take = 20,
    int skip = 0,
    String filter = 'all',
    String sort = 'modified',
  }) async {
    final response = await _request('GET', 'request', queryParams: {
      'take': '$take',
      'skip': '$skip',
      'filter': filter,
      'sort': sort,
    });
    if (response.statusCode != 200) {
      appLogger.w('Seer getRequests failed: ${response.statusCode} ${response.body}');
      throw Exception('getRequests: ${response.statusCode} ${response.body}');
    }
    final body = jsonDecode(response.body);
    // Jellyseerr returns { results: [...] } but might also return a bare array
    if (body is List) {
      return body.map((e) => SeerRequest.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerRequestsResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<void> approveRequest(int id) async {
    final response = await _request('POST', 'request/$id/approve');
    if (response.statusCode != 200) {
      throw Exception('Failed to approve: ${response.statusCode}');
    }
  }

  Future<void> declineRequest(int id) async {
    final response = await _request('POST', 'request/$id/decline');
    if (response.statusCode != 200) {
      throw Exception('Failed to decline: ${response.statusCode}');
    }
  }

  Future<void> deleteRequest(int id) async {
    final response = await _request('DELETE', 'request/$id');
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete request: ${response.statusCode}');
    }
  }

  // ─── Search & Discover ───

  Future<List<SeerSearchResultItem>> search(String query, {int page = 1}) async {
    // Build URI manually to avoid double-encoding of the query parameter
    final encodedQuery = Uri.encodeComponent(query);
    final response = await _request('GET', 'search?query=$encodedQuery&page=$page');
    if (response.statusCode != 200) {
      appLogger.w('Seer search failed: ${response.statusCode} ${response.body}');
      throw Exception('Search failed: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    // Jellyseerr search returns { results: [...] }
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerSearchResponse.fromJson(body as Map<String, dynamic>);
    return data.results.where((r) => r.mediaType != null).toList();
  }

  Future<List<SeerSearchResultItem>> getTrending({int page = 1}) async {
    final response = await _request('GET', 'discover/trending', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      appLogger.w('Seer getTrending failed: ${response.statusCode} ${response.body}');
      throw Exception('Failed to get trending: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getDiscoverMovies({int page = 1}) async {
    final response = await _request('GET', 'discover/movies', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      appLogger.w('Seer getDiscoverMovies failed: ${response.statusCode}');
      throw Exception('Failed to get discover movies: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getDiscoverTv({int page = 1}) async {
    final response = await _request('GET', 'discover/tv', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      appLogger.w('Seer getDiscoverTv failed: ${response.statusCode}');
      throw Exception('Failed to get discover TV: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  // ─── Media Details ───

  Future<SeerMediaDetails> getMovieDetails(int tmdbId) async {
    final response = await _request('GET', 'movie/$tmdbId');
    if (response.statusCode != 200) {
      throw Exception('Failed to get movie details: ${response.statusCode}');
    }
    return SeerMediaDetails.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<SeerMediaDetails> getTvDetails(int tmdbId) async {
    final response = await _request('GET', 'tv/$tmdbId');
    if (response.statusCode != 200) {
      throw Exception('Failed to get TV details: ${response.statusCode}');
    }
    return SeerMediaDetails.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  // ─── Service Settings ───

  Future<List<SeerServiceSettings>> getRadarrSettings() async {
    final response = await _request('GET', 'service/radarr');
    if (response.statusCode != 200) return [];
    final list = jsonDecode(response.body) as List<dynamic>;
    return list.map((e) => SeerServiceSettings.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<SeerServiceSettings>> getSonarrSettings() async {
    final response = await _request('GET', 'service/sonarr');
    if (response.statusCode != 200) return [];
    final list = jsonDecode(response.body) as List<dynamic>;
    return list.map((e) => SeerServiceSettings.fromJson(e as Map<String, dynamic>)).toList();
  }

  // ─── Genre Slider ───

  Future<List<SeerGenreSliderItem>> getMovieGenreSlider() async {
    final response = await _request('GET', 'discover/genreslider/movie');
    if (response.statusCode != 200) {
      throw Exception('Failed to get movie genre slider: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerGenreSliderItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    // Wrapped in { genres: [...] }
    final list = (body as Map<String, dynamic>)['genres'] as List<dynamic>? ?? [];
    return list.map((e) => SeerGenreSliderItem.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<SeerGenreSliderItem>> getTvGenreSlider() async {
    final response = await _request('GET', 'discover/genreslider/tv');
    if (response.statusCode != 200) {
      throw Exception('Failed to get TV genre slider: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerGenreSliderItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final list = (body as Map<String, dynamic>)['genres'] as List<dynamic>? ?? [];
    return list.map((e) => SeerGenreSliderItem.fromJson(e as Map<String, dynamic>)).toList();
  }

  // ─── Discover by Genre / Studio / Network ───

  Future<List<SeerSearchResultItem>> getMoviesByGenre(int genreId, {int page = 1}) async {
    final response = await _request('GET', 'discover/movies/genre/$genreId', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get movies by genre: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getTvByGenre(int genreId, {int page = 1}) async {
    final response = await _request('GET', 'discover/tv/genre/$genreId', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get TV by genre: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getMoviesByStudio(int studioId, {int page = 1}) async {
    final response = await _request('GET', 'discover/movies', queryParams: {
      'page': '$page',
      'sortBy': 'popularity.desc',
      'studio': '$studioId',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get movies by studio: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getTvByNetwork(int networkId, {int page = 1}) async {
    final response = await _request('GET', 'discover/tv', queryParams: {
      'page': '$page',
      'sortBy': 'popularity.desc',
      'network': '$networkId',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get TV by network: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getUpcomingMovies({int page = 1}) async {
    final response = await _request('GET', 'discover/movies/upcoming', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get upcoming movies: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getUpcomingTv({int page = 1}) async {
    final response = await _request('GET', 'discover/tv/upcoming', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get upcoming TV: ${response.statusCode}');
    }
    final body = jsonDecode(response.body);
    if (body is List) {
      return body.map((e) => SeerSearchResultItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    final data = SeerTrendingResponse.fromJson(body as Map<String, dynamic>);
    return data.results;
  }

  void dispose() {
    _httpClient.close();
  }
}