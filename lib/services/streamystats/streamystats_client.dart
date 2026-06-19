import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utils/app_logger.dart';

/// Response from StreamyStats /api/recommendations?format=ids
class RecommendationIds {
  final List<String> movies;
  final List<String> series;
  final int total;

  const RecommendationIds({required this.movies, required this.series, required this.total});

  factory RecommendationIds.fromJson(Map<String, dynamic> json) {
    // The API returns {data: {movies: [], series: [], total: N}} or
    // {movies: [], series: [], total: N} depending on the endpoint version
    final data = json['data'] as Map<String, dynamic>? ?? json;
    return RecommendationIds(
      movies: (data['movies'] as List<dynamic>?)?.cast<String>() ?? [],
      series: (data['series'] as List<dynamic>?)?.cast<String>() ?? [],
      total: (data['total'] as int?) ?? 0,
    );
  }
}

/// StreamyStats API client.
///
/// Calls the self-hosted StreamyStats server for AI/vector-based media
/// recommendations. Auth uses the Jellyfin access token via the
/// `Authorization: MediaBrowser Token="..."` header — the same auth
/// StreamyStats validates against the Jellyfin server.
class StreamyStatsClient {
  String? _baseUrl;
  String? _jellyfinToken;
  String? _jellyfinServerId;
  final http.Client _httpClient;

  StreamyStatsClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  void configure({required String baseUrl, required String jellyfinToken, required String jellyfinServerId}) {
    _baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    _jellyfinToken = jellyfinToken;
    _jellyfinServerId = jellyfinServerId;
    appLogger.i('StreamyStats: configured baseUrl=$_baseUrl, serverId=$_jellyfinServerId');
  }

  void clearSession() {
    _baseUrl = null;
    _jellyfinToken = null;
    _jellyfinServerId = null;
  }

  bool get isConfigured => _baseUrl != null && _jellyfinToken != null && _jellyfinServerId != null;

  Map<String, String> _buildHeaders() {
    return {
      'Authorization': 'MediaBrowser Token="$_jellyfinToken"',
      'Accept': 'application/json',
    };
  }

  /// Fetch recommendation IDs from StreamyStats.
  /// Returns Jellyfin item IDs for movies and/or series.
  Future<RecommendationIds> getRecommendations({
    String type = 'all',
    int limit = 20,
  }) async {
    if (!isConfigured) {
      throw Exception('StreamyStats not configured');
    }

    final uri = Uri.parse('$_baseUrl/api/recommendations').replace(queryParameters: {
      'jellyfinServerId': _jellyfinServerId,
      'format': 'ids',
      'type': type,
      'limit': '$limit',
      'includeBasedOn': 'false',
      'includeReasons': 'false',
    });

    appLogger.d('StreamyStats: GET $uri');
    final response = await _httpClient.get(uri, headers: _buildHeaders());

    appLogger.d('StreamyStats: ${response.statusCode}');

    if (response.statusCode != 200) {
      throw Exception('StreamyStats recommendations failed: ${response.statusCode} ${response.body}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return RecommendationIds.fromJson(json);
  }

  void dispose() {
    _httpClient.close();
  }
}