import 'package:drift/drift.dart';
import 'app_database.dart';
import 'tables.dart';

/// Database operations for the client-side watchlist.
///
/// All queries are scoped by [profileId] so each Plex Home user / local profile
/// has an independent watchlist. The composite primary key
/// (profileId + globalKey) prevents duplicate entries.
extension WatchlistDatabaseOperations on AppDatabase {
  /// Insert a watchlist item, ignoring if already present (idempotent toggle-add).
  Future<void> addWatchlistItem(WatchlistItemsCompanion item) async {
    await into(watchlistItems).insert(item, mode: InsertMode.insertOrIgnore);
  }

  /// Remove a watchlist item by (profileId, globalKey).
  Future<void> removeWatchlistItem({required String profileId, required String globalKey}) async {
    await (delete(watchlistItems)
          ..where((t) => t.profileId.equals(profileId) & t.globalKey.equals(globalKey)))
        .go();
  }

  /// Check if an item is in the watchlist for the given profile.
  Future<bool> isInWatchlist({required String profileId, required String globalKey}) async {
    final result = await (select(watchlistItems)
          ..where((t) => t.profileId.equals(profileId) & t.globalKey.equals(globalKey)))
        .get();
    return result.isNotEmpty;
  }

  /// Get all watchlist items for a profile, ordered by most-recently-added first.
  Future<List<WatchlistItem>> getWatchlistItems({required String profileId}) async {
    return (select(watchlistItems)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
        .get();
  }

  /// Stream of watchlist items for a profile — emits on any change.
  Stream<List<WatchlistItem>> watchWatchlistItems({required String profileId}) {
    return (select(watchlistItems)
          ..where((t) => t.profileId.equals(profileId))
          ..orderBy([(t) => OrderingTerm.desc(t.addedAt)]))
        .watch();
  }

  /// Get the count of watchlist items for a profile.
  Future<int> getWatchlistCount({required String profileId}) async {
    final items = await (select(watchlistItems)
          ..where((t) => t.profileId.equals(profileId)))
        .get();
    return items.length;
  }

  /// Remove all watchlist items for a profile (clear watchlist).
  Future<void> clearWatchlist({required String profileId}) async {
    await (delete(watchlistItems)..where((t) => t.profileId.equals(profileId))).go();
  }
}