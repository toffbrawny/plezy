import 'package:drift/drift.dart';
import 'app_database.dart';
import 'tables.dart';

/// Database operations for Seer (Jellyseerr/Overseerr) integration.
extension SeerDatabaseOperations on AppDatabase {
  // ─── Config ───

  Future<void> saveSeerConfig(SeerConfigCompanion config) async {
    await into(seerConfig).insertOnConflictUpdate(config);
  }

  Future<SeerConfigItem?> getSeerConfig({required String serverId, required String userId}) async {
    final result = await (select(seerConfig)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId)))
        .getSingleOrNull();
    return result;
  }

  Future<void> clearSeerConfig({required String serverId, required String userId}) async {
    await (delete(seerConfig)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId)))
        .go();
  }

  Stream<SeerConfigItem?> watchSeerConfig({required String serverId, required String userId}) {
    return (select(seerConfig)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId)))
        .watchSingleOrNull();
  }

  // ─── Requests Cache ───

  Future<void> cacheSeerRequests({
    required String serverId,
    required String userId,
    required List<SeerRequestsCompanion> requests,
  }) async {
    await (delete(seerRequests)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId)))
        .go();
    await batch((b) => b.insertAll(seerRequests, requests));
  }

  Future<List<SeerRequestItem>> getCachedSeerRequests({
    required String serverId,
    required String userId,
  }) async {
    return (select(seerRequests)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.desc(t.cachedAt)]))
        .get();
  }

  Stream<List<SeerRequestItem>> watchCachedSeerRequests({
    required String serverId,
    required String userId,
  }) {
    return (select(seerRequests)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.desc(t.cachedAt)]))
        .watch();
  }

  Future<void> clearSeerRequestsCache({required String serverId, required String userId}) async {
    await (delete(seerRequests)
          ..where((t) => t.serverId.equals(serverId) & t.userId.equals(userId)))
        .go();
  }
}