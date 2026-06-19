import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:plezy/media/ids.dart';
import 'package:plezy/media/media_item.dart';
import 'package:plezy/media/media_server_client.dart';
import 'package:plezy/mixins/disposable_change_notifier_mixin.dart';
import 'package:plezy/providers/multi_server_provider.dart';
import 'package:plezy/services/streamystats/streamystats_client.dart';
import 'package:plezy/utils/app_logger.dart';

/// Provider for StreamyStats AI recommendations.
///
/// Fetches recommendation IDs from StreamyStats, then hydrates them into
/// full MediaItem objects using the existing Jellyfin/Plex client. The
/// StreamyStats server URL is stored in settings.
class StreamyStatsProvider extends ChangeNotifier with DisposableChangeNotifierMixin {
  final StreamyStatsClient _client;
  final MultiServerProvider _multiServerProvider;

  // Config
  String? _serverUrl;
  bool _movieRecsEnabled = true;
  bool _seriesRecsEnabled = true;

  // State
  List<MediaItem> _movieRecommendations = [];
  List<MediaItem> _seriesRecommendations = [];
  bool _isLoading = false;
  String? _error;

  StreamyStatsProvider({
    required MultiServerProvider multiServerProvider,
    StreamyStatsClient? client,
  })  : _multiServerProvider = multiServerProvider,
        _client = client ?? StreamyStatsClient();

  String? get serverUrl => _serverUrl;
  bool get movieRecsEnabled => _movieRecsEnabled;
  bool get seriesRecsEnabled => _seriesRecsEnabled;
  bool get isConfigured => _serverUrl != null && _serverUrl!.isNotEmpty;

  List<MediaItem> get movieRecommendations => _movieRecommendations;
  List<MediaItem> get seriesRecommendations => _seriesRecommendations;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void setServerUrl(String? url) {
    _serverUrl = url;
    safeNotifyListeners();
  }

  void setMovieRecsEnabled(bool enabled) {
    _movieRecsEnabled = enabled;
    safeNotifyListeners();
  }

  void setSeriesRecsEnabled(bool enabled) {
    _seriesRecsEnabled = enabled;
    safeNotifyListeners();
  }

  /// Load recommendations from StreamyStats and hydrate via Jellyfin.
  Future<void> loadRecommendations() async {
    if (!isConfigured || !_multiServerProvider.hasConnectedServers) {
      return;
    }

    // Get the first connected Jellyfin server for auth
    final serverIds = _multiServerProvider.serverManager.onlineServerIds;
    if (serverIds.isEmpty) return;

    final serverId = ServerId.tryParse(serverIds.first);
    if (serverId == null) return;
    final client = _multiServerProvider.getClientForServer(serverId);
    if (client == null) return;

    // Get Jellyfin server machine ID and access token
    final jellyfinServerId = client.serverId?.toString();
    if (jellyfinServerId == null || jellyfinServerId.isEmpty) return;

    // Extract the access token from the client's connection
    final accessToken = _extractAccessToken(client);
    if (accessToken == null) {
      appLogger.w('StreamyStats: could not extract Jellyfin access token');
      return;
    }

    _isLoading = true;
    _error = null;
    safeNotifyListeners();

    try {
      _client.configure(
        baseUrl: _serverUrl!,
        jellyfinToken: accessToken,
        jellyfinServerId: jellyfinServerId,
      );

      // Fetch recommendation IDs
      final recs = await _client.getRecommendations(limit: 20);

      // Hydrate movies and series in parallel
      final results = await Future.wait([
        _hydrateItems(recs.movies, client),
        _hydrateItems(recs.series, client),
      ]);

      _movieRecommendations = results[0];
      _seriesRecommendations = results[1];
      appLogger.i('StreamyStats: loaded ${_movieRecommendations.length} movies, ${_seriesRecommendations.length} series');
    } catch (e) {
      _error = e.toString();
      appLogger.w('StreamyStats: failed to load recommendations: $e');
    }

    _isLoading = false;
    safeNotifyListeners();
  }

  /// Fetch full MediaItem objects for the given Jellyfin item IDs.
  Future<List<MediaItem>> _hydrateItems(List<String> itemIds, MediaServerClient client) async {
    final items = <MediaItem>[];
    for (final id in itemIds) {
      try {
        final item = await client.fetchItem(id);
        if (item != null) items.add(item);
      } catch (e) {
        appLogger.w('StreamyStats: failed to hydrate item $id: $e');
      }
    }
    return items;
  }

  /// Extract the Jellyfin access token from the client.
  /// The JellyfinClient stores it in the connection.
  String? _extractAccessToken(MediaServerClient client) {
    // Use reflection-free approach: the client's headers include X-Emby-Token
    // but we can't access them directly. Instead, we use the fact that
    // JellyfinClient exposes serverId from connection.serverMachineId.
    // The access token is in the connection's accessToken field.
    // Since MediaServerClient is abstract, we check if it's a JellyfinClient.
    try {
      final dynamic jClient = client;
      // Access the connection's accessToken via the client's internal field
      // JellyfinClient has a `connection` getter (or _connection)
      final conn = jClient.connection;
      return conn?.accessToken as String?;
    } catch (e) {
      appLogger.w('StreamyStats: could not extract token: $e');
      return null;
    }
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }
}