import 'dart:async';
import 'dart:convert';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:plezy/database/app_database.dart';
import 'package:plezy/database/seer_operations.dart';
import 'package:plezy/media/ids.dart';
import 'package:plezy/mixins/disposable_change_notifier_mixin.dart';
import 'package:plezy/models/seer/seer_models.dart';
import 'package:plezy/services/seer/seer_client.dart';
import 'package:plezy/utils/app_logger.dart';

/// State for the Requests screen.
enum SeerLoadState { idle, loading, success, error }

/// Provider for the Seer (Jellyseerr/Overseerr) integration.
///
/// Manages authentication, requests, search, and discover content. The
/// session is scoped per media-server user (serverId + userId), mirroring
/// AFinity's per-Jellyfin-user auth model. The Seer client is configured
/// dynamically when the active session changes.
class SeerProvider extends ChangeNotifier with DisposableChangeNotifierMixin {
  final AppDatabase _database;
  final SeerClient _client;

  String? _serverId;
  String? _userId;
  SeerUser? _currentUser;
  SeerPermissions? _permissions;

  // UI state
  SeerLoadState _loadState = SeerLoadState.idle;
  String? _error;
  List<SeerRequest> _requests = [];
  List<SeerSearchResultItem> _trending = [];
  List<SeerSearchResultItem> _discoverMovies = [];
  List<SeerSearchResultItem> _discoverTv = [];
  List<SeerSearchResultItem> _searchResults = [];
  bool _isSearching = false;
  bool _isAuthenticating = false;

  SeerProvider({required AppDatabase database, SeerClient? client})
      : _database = database,
        _client = client ?? SeerClient() {
    _init();
  }

  void _init() {
    // Try to restore a saved session
    _restoreSession();
  }

  // ─── Session ───

  Future<void> _restoreSession() async {
    // Called when serverId/userId are set — loads config from DB and
    // reconfigures the client if a valid session exists.
    if (_serverId == null || _userId == null) return;

    final config = await _database.getSeerConfig(serverId: _serverId!, userId: _userId!);
    if (config == null || !config.isLoggedIn || config.cookie == null) {
      safeNotifyListeners();
      return;
    }

    _client.configure(baseUrl: config.seerUrl, cookie: config.cookie);
    await _loadCurrentUser();
    await _loadAll();
  }

  /// Set the active media-server session (called when the active profile
  /// changes). Restores the Seer auth for that session if it exists.
  void setActiveSession(String? serverId, String? userId) {
    if (serverId == _serverId && userId == _userId) return;
    _serverId = serverId;
    _userId = userId;
    _client.clearSession();
    _currentUser = null;
    _permissions = null;
    _requests = [];
    _trending = [];
    _discoverMovies = [];
    _discoverTv = [];
    _searchResults = [];
    _restoreSession();
    safeNotifyListeners();
  }

  bool get isAuthenticated => _currentUser != null;
  bool get isAuthenticating => _isAuthenticating;
  SeerUser? get currentUser => _currentUser;
  SeerPermissions? get permissions => _permissions;
  SeerLoadState get loadState => _loadState;
  String? get error => _error;

  List<SeerRequest> get requests => _requests;
  List<SeerSearchResultItem> get trending => _trending;
  List<SeerSearchResultItem> get discoverMovies => _discoverMovies;
  List<SeerSearchResultItem> get discoverTv => _discoverTv;
  List<SeerSearchResultItem> get searchResults => _searchResults;
  bool get isSearching => _isSearching;

  // ─── Auth ───

  Future<bool> verifyServer(String url) async {
    return SeerClient.verifyServer(url);
  }

  Future<bool> login({
    required String serverUrl,
    required String username,
    required String password,
    bool useJellyfinAuth = true,
  }) async {
    _isAuthenticating = true;
    _error = null;
    safeNotifyListeners();

    try {
      // First verify the server
      final isValid = await verifyServer(serverUrl);
      if (!isValid) {
        _error = 'Could not reach Seer server. Check the URL.';
        _isAuthenticating = false;
        safeNotifyListeners();
        return false;
      }

      // Configure client with the URL
      final cleanUrl = serverUrl.endsWith('/')
          ? serverUrl.substring(0, serverUrl.length - 1)
          : serverUrl;
      _client.configure(baseUrl: cleanUrl);

      // Login
      final (user, cookie) = useJellyfinAuth
          ? await _client.loginJellyfin(username, password)
          : await _client.loginLocal(username, password);

      _currentUser = user;
      _permissions = SeerPermissions(user.permissions);

      // Persist config to DB
      if (_serverId != null && _userId != null) {
        await _database.saveSeerConfig(SeerConfigCompanion.insert(
          serverId: _serverId!,
          userId: _userId!,
          seerUrl: cleanUrl,
          cookie: Value(cookie),
          username: Value(user.username ?? user.displayName),
          permissions: Value(user.permissions),
          isLoggedIn: const Value(true),
          cachedAt: DateTime.now().millisecondsSinceEpoch,
        ));
      }

      _isAuthenticating = false;
      safeNotifyListeners();

      // Load content
      await _loadAll();
      return true;
    } catch (e) {
      _error = _parseLoginError(e.toString());
      _isAuthenticating = false;
      safeNotifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _client.logout();
    } catch (_) {}
    if (_serverId != null && _userId != null) {
      await _database.clearSeerConfig(serverId: _serverId!, userId: _userId!);
      await _database.clearSeerRequestsCache(serverId: _serverId!, userId: _userId!);
    }
    _currentUser = null;
    _permissions = null;
    _requests = [];
    _trending = [];
    _discoverMovies = [];
    _discoverTv = [];
    safeNotifyListeners();
  }

  String _parseLoginError(String error) {
    final lower = error.toLowerCase();
    if (lower.contains('401')) return 'Invalid username or password';
    if (lower.contains('403')) return 'Access forbidden. Check your permissions.';
    if (lower.contains('404')) return 'Server not found. Check the URL.';
    if (lower.contains('timeout')) return 'Connection timed out. Try again.';
    if (lower.contains('socket') || lower.contains('network')) {
      return 'Network error. Check your connection.';
    }
    return 'Login failed. Please try again.';
  }

  // ─── Data Loading ───

  Future<void> _loadCurrentUser() async {
    try {
      _currentUser = await _client.getCurrentUser();
      _permissions = SeerPermissions(_currentUser!.permissions);
      safeNotifyListeners();
    } catch (e) {
      appLogger.w('Seer: failed to load current user: $e');
      // Session might be invalid
      _currentUser = null;
    }
  }

  Future<void> _loadAll() async {
    if (!isAuthenticated) return;
    _loadState = SeerLoadState.loading;
    _error = null;
    safeNotifyListeners();

    try {
      await Future.wait([
        _loadRequests(),
        _loadTrending(),
        _loadDiscoverMovies(),
        _loadDiscoverTv(),
      ]);
      _loadState = SeerLoadState.success;
    } catch (e) {
      _error = e.toString();
      _loadState = SeerLoadState.error;
    }
    safeNotifyListeners();
  }

  Future<void> refresh() async => _loadAll();

  Future<void> _loadRequests() async {
    try {
      _requests = await _client.getRequests();
      // Cache to DB for offline
      if (_serverId != null && _userId != null) {
        final companions = _requests.map((r) => SeerRequestsCompanion.insert(
              serverId: _serverId!,
              userId: _userId!,
              requestId: r.id,
              status: Value(r.status),
              mediaType: Value(r.media?.mediaType),
              tmdbId: Value(r.media?.tmdbId),
              title: Value(r.media?.title ?? r.media?.name),
              posterPath: Value(r.media?.posterPath),
              backdropPath: Value(r.media?.backdropPath),
              releaseDate: Value(r.media?.releaseDate ?? r.media?.firstAirDate),
              requestedByName: Value(r.requestedBy?.displayName),
              requestedByAvatar: Value(r.requestedBy?.avatar),
              is4k: Value(r.is4k),
              mediaStatus: Value(r.media?.status),
              seasons: Value(r.seasons != null ? jsonEncode(r.seasons) : null),
              cachedAt: DateTime.now().millisecondsSinceEpoch,
            ));
        await _database.cacheSeerRequests(
          serverId: _serverId!,
          userId: _userId!,
          requests: companions.toList(),
        );
      }
    } catch (e) {
      appLogger.w('Seer: failed to load requests: $e');
      // Fall back to cached
      if (_serverId != null && _userId != null) {
        final cached = await _database.getCachedSeerRequests(
          serverId: _serverId!,
          userId: _userId!,
        );
        _requests = cached.map(_cachedToRequest).toList();
      }
    }
  }

  SeerRequest _cachedToRequest(SeerRequestItem c) {
    return SeerRequest(
      id: c.requestId,
      status: c.status,
      is4k: c.is4k,
      media: SeerMediaInfo(
        id: c.tmdbId ?? 0,
        mediaType: c.mediaType,
        tmdbId: c.tmdbId,
        title: c.title,
        posterPath: c.posterPath,
        backdropPath: c.backdropPath,
        releaseDate: c.releaseDate,
        status: c.mediaStatus,
      ),
      requestedBy: SeerRequestUser(
        id: 0,
        displayName: c.requestedByName,
        avatar: c.requestedByAvatar,
      ),
    );
  }

  Future<void> _loadTrending() async {
    try {
      _trending = await _client.getTrending();
    } catch (e) {
      appLogger.w('Seer: failed to load trending: $e');
    }
  }

  Future<void> _loadDiscoverMovies() async {
    try {
      _discoverMovies = await _client.getDiscoverMovies();
    } catch (e) {
      appLogger.w('Seer: failed to load discover movies: $e');
    }
  }

  Future<void> _loadDiscoverTv() async {
    try {
      _discoverTv = await _client.getDiscoverTv();
    } catch (e) {
      appLogger.w('Seer: failed to load discover TV: $e');
    }
  }

  // ─── Search ───

  Future<void> search(String query) async {
    if (query.trim().length < 2) {
      _searchResults = [];
      safeNotifyListeners();
      return;
    }

    _isSearching = true;
    safeNotifyListeners();

    try {
      _searchResults = await _client.search(query);
    } catch (e) {
      appLogger.w('Seer: search failed: $e');
      _searchResults = [];
    }

    _isSearching = false;
    safeNotifyListeners();
  }

  void clearSearch() {
    _searchResults = [];
    safeNotifyListeners();
  }

  // ─── Requests ───

  Future<SeerRequest?> createRequest({
    required int mediaId,
    required SeerMediaType mediaType,
    List<int>? seasons,
    bool is4k = false,
    int? serverId,
    int? profileId,
    String? rootFolder,
  }) async {
    try {
      final request = await _client.createRequest(
        mediaId: mediaId,
        mediaType: mediaType,
        seasons: seasons,
        is4k: is4k,
        serverId: serverId,
        profileId: profileId,
        rootFolder: rootFolder,
      );
      // Refresh the requests list
      await _loadRequests();
      safeNotifyListeners();
      return request;
    } catch (e) {
      _error = 'Failed to create request: $e';
      safeNotifyListeners();
      return null;
    }
  }

  Future<bool> approveRequest(int id) async {
    try {
      await _client.approveRequest(id);
      await _loadRequests();
      return true;
    } catch (e) {
      _error = 'Failed to approve: $e';
      safeNotifyListeners();
      return false;
    }
  }

  Future<bool> declineRequest(int id) async {
    try {
      await _client.declineRequest(id);
      await _loadRequests();
      return true;
    } catch (e) {
      _error = 'Failed to decline: $e';
      safeNotifyListeners();
      return false;
    }
  }

  Future<bool> deleteRequest(int id) async {
    try {
      await _client.deleteRequest(id);
      await _loadRequests();
      return true;
    } catch (e) {
      _error = 'Failed to delete: $e';
      safeNotifyListeners();
      return false;
    }
  }

  // ─── Media Details ───

  Future<SeerMediaDetails> getMediaDetails(int tmdbId, SeerMediaType type) async {
    return type == SeerMediaType.movie
        ? _client.getMovieDetails(tmdbId)
        : _client.getTvDetails(tmdbId);
  }

  // ─── Service Settings ───

  Future<List<SeerServiceSettings>> getRadarrSettings() => _client.getRadarrSettings();
  Future<List<SeerServiceSettings>> getSonarrSettings() => _client.getSonarrSettings();

  void clearError() {
    _error = null;
    safeNotifyListeners();
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }
}