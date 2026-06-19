import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../models/seer/seer_models.dart';
import '../../utils/app_logger.dart';

/// Seer (Jellyseerr/Overseerr) API client.
///
/// Handles cookie-based session auth and CSRF tokens, mirroring AFinity's
/// approach. The base URL is dynamic (set per-session) and cookies are
/// managed in-memory. CSRF tokens are seeded via a pre-flight GET.
class SeerClient {
  String? _baseUrl;
  String? _cookie;
  String? _xsrfToken;
  final http.Client _httpClient;

  SeerClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  /// Set the base URL and session cookie for the current session.
  void configure({required String baseUrl, String? cookie}) {
    _baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    _cookie = cookie;
    _xsrfToken = null;
  }

  /// Clear the current session.
  void clearSession() {
    _baseUrl = null;
    _cookie = null;
    _xsrfToken = null;
  }

  bool get isConfigured => _baseUrl != null;

  String get baseUrl => _baseUrl ?? '';

  /// Verify a server is reachable (static method — no session needed).
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
        if (response.statusCode == 200) {
          return true;
        }
      } catch (e) {
        appLogger.d('Seer verifyServer: $candidate failed: $e');
      }
    }
    return false;
  }

  Map<String, String> _buildHeaders({Map<String, String>? extra}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (_cookie != null && _cookie!.isNotEmpty) {
      headers['Cookie'] = _cookie!;
    }
    if (_xsrfToken != null && _xsrfToken!.isNotEmpty) {
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
      // Extract Set-Cookie header for XSRF-TOKEN
      final setCookie = response.headers['set-cookie'];
      if (setCookie != null) {
        _extractXsrfFromCookie(setCookie);
      }
    } catch (e) {
      appLogger.w('Seer: failed to seed XSRF token: $e');
    }
  }

  void _extractXsrfFromCookie(String setCookie) {
    // Parse XSRF-TOKEN from Set-Cookie header
    final parts = setCookie.split(';');
    for (final part in parts) {
      final trimmed = part.trim();
      if (trimmed.startsWith('XSRF-TOKEN=')) {
        _xsrfToken = trimmed.substring('XSRF-TOKEN='.length);
        break;
      }
    }
  }

  void _processSetCookie(String? setCookie) {
    if (setCookie == null) return;
    // Update the session cookie if a new one is provided
    if (setCookie.contains('session=')) {
      final parts = setCookie.split(';');
      for (final part in parts) {
        final trimmed = part.trim();
        if (trimmed.startsWith('session=')) {
          _cookie = trimmed;
          break;
        }
      }
    }
    _extractXsrfFromCookie(setCookie);
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

    final response = await _httpClient.send(
      http.Request(method, uri)
        ..headers.addAll(_buildHeaders())
        ..body = body != null ? jsonEncode(body) : '',
    ).then(http.Response.fromStream);

    _processSetCookie(response.headers['set-cookie']);

    if (response.statusCode == 403) {
      clearSession();
      throw Exception('Session expired');
    }

    return response;
  }

  // ─── Auth ───

  Future<(SeerUser, String?)> loginJellyfin(String username, String password) async {
    final response = await _request('POST', 'auth/jellyfin',
        body: {'username': username, 'password': password});
    if (response.statusCode != 200) {
      throw Exception('Login failed: ${response.statusCode} ${response.body}');
    }
    final cookie = response.headers['set-cookie'];
    _processSetCookie(cookie);
    final user = SeerUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return (user, cookie);
  }

  Future<(SeerUser, String?)> loginLocal(String email, String password) async {
    final response = await _request('POST', 'auth/local',
        body: {'email': email, 'password': password});
    if (response.statusCode != 200) {
      throw Exception('Login failed: ${response.statusCode} ${response.body}');
    }
    final cookie = response.headers['set-cookie'];
    _processSetCookie(cookie);
    final user = SeerUser.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return (user, cookie);
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
    // Re-fetch to get fully populated object
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
      throw Exception('Failed to get requests: ${response.statusCode}');
    }
    final data = SeerRequestsResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
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
    final response = await _request('GET', 'search', queryParams: {
      'query': query,
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Search failed: ${response.statusCode}');
    }
    final data = SeerSearchResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return data.results.where((r) => r.mediaType != null).toList();
  }

  Future<List<SeerSearchResultItem>> getTrending({int page = 1}) async {
    final response = await _request('GET', 'discover/trending', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get trending: ${response.statusCode}');
    }
    final data = SeerTrendingResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getDiscoverMovies({int page = 1}) async {
    final response = await _request('GET', 'discover/movies', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get discover movies: ${response.statusCode}');
    }
    final data = SeerTrendingResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return data.results;
  }

  Future<List<SeerSearchResultItem>> getDiscoverTv({int page = 1}) async {
    final response = await _request('GET', 'discover/tv', queryParams: {
      'page': '$page',
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to get discover TV: ${response.statusCode}');
    }
    final data = SeerTrendingResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
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

  void dispose() {
    _httpClient.close();
  }
}