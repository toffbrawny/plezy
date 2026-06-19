import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart' show Value;
import 'package:plezy/database/app_database.dart';
import 'package:plezy/database/watchlist_operations.dart';
import 'package:plezy/media/media_item.dart';
import 'package:plezy/mixins/disposable_change_notifier_mixin.dart';
import 'package:plezy/utils/app_logger.dart';

/// Client-side watchlist provider.
///
/// Stores bookmarked media items in the local Drift database (not on the
/// server). Each item is scoped by the active profile ID so Plex Home users
/// have independent watchlists. The provider exposes:
/// - [items]: the current watchlist, ordered by most-recently-added first.
/// - [isInWatchlist]: O(1) membership check by globalKey.
/// - [toggle]: add or remove an item.
///
/// Inspired by AFinity's watchlist UX (toggle button on detail screen, grouped
/// display) but stored entirely client-side for offline access.
class WatchlistProvider extends ChangeNotifier with DisposableChangeNotifierMixin {
  final AppDatabase _database;
  StreamSubscription<List<WatchlistItem>>? _watchSub;
  String? _activeProfileId;

  /// In-memory cache of watchlist items, keyed by globalKey.
  final Map<String, WatchlistItem> _items = {};

  WatchlistProvider({required AppDatabase database}) : _database = database {
    _init();
  }

  void _init() {
    _watchSub?.cancel();
    final pid = _activeProfileId ?? '';
    _watchSub = _database.watchWatchlistItems(profileId: pid).listen((rows) {
      _items
        ..clear()
        ..addAll({for (final r in rows) r.globalKey: r});
      safeNotifyListeners();
    });
  }

  /// Set the active profile ID and reload the watchlist for that profile.
  void setActiveProfileId(String? id) {
    if (id == _activeProfileId) return;
    _activeProfileId = id;
    _init();
  }

  /// Whether the watchlist is currently empty.
  bool get isEmpty => _items.isEmpty;

  /// Number of items in the watchlist.
  int get count => _items.length;

  /// All watchlist items, ordered by most-recently-added first.
  List<WatchlistItem> get items =>
      _items.values.toList()..sort((a, b) => b.addedAt.compareTo(a.addedAt));

  /// Items filtered by media kind.
  List<WatchlistItem> itemsByKind(String kind) =>
      items.where((i) => i.kind == kind).toList();

  /// O(1) membership check.
  bool isInWatchlist(String globalKey) => _items.containsKey(globalKey);

  /// Toggle an item in/out of the watchlist.
  Future<bool> toggle(MediaItem media) async {
    final pid = _activeProfileId ?? '';
    final globalKey = media.globalKey;

    if (_items.containsKey(globalKey)) {
      await _database.removeWatchlistItem(profileId: pid, globalKey: globalKey);
      appLogger.i('Removed from watchlist: $globalKey');
      return false; // now removed
    }

    await _database.addWatchlistItem(
      WatchlistItemsCompanion.insert(
        profileId: Value(pid),
        serverId: media.serverId ?? '',
        ratingKey: media.id,
        globalKey: globalKey,
        backend: media.backend.name,
        kind: media.kind.name,
        title: media.title ?? media.displayTitle,
        titleSort: Value(media.titleSort),
        thumbPath: Value(media.thumbPath),
        artPath: Value(media.artPath),
        year: Value(media.year),
        summary: Value(media.summary),
        parentRatingKey: Value(media.parentId),
        grandparentRatingKey: Value(media.grandparentId),
        parentTitle: Value(media.parentTitle),
        grandparentTitle: Value(media.grandparentTitle),
        parentIndex: Value(media.parentIndex),
        index: Value(media.index),
        libraryId: Value(media.libraryId),
        libraryTitle: Value(media.libraryTitle),
        addedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
    appLogger.i('Added to watchlist: $globalKey');
    return true; // now added
  }

  /// Remove an item by globalKey (without needing the full MediaItem).
  Future<void> remove(String globalKey) async {
    final pid = _activeProfileId ?? '';
    await _database.removeWatchlistItem(profileId: pid, globalKey: globalKey);
  }

  /// Clear all items from the watchlist.
  Future<void> clearAll() async {
    final pid = _activeProfileId ?? '';
    await _database.clearWatchlist(profileId: pid);
  }

  @override
  void dispose() {
    _watchSub?.cancel();
    super.dispose();
  }
}