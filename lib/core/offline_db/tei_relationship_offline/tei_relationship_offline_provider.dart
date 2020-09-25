import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:sqflite/sqflite.dart';

class TeiRelatioShipOfflineProvider extends OfflineDbProvider {
  final String table = 'tei_relationships';
  // colums
  final String id = 'id';
  final String relationshipType = 'relationshipType';
  final String fromTei = 'fromTei';
  final String toTei = 'toTei';

  addOrUpdateTeirelationShip(TeiRelationship teiRelationship) async {
    var dbClient = await db;
    var data = TeiRelationship().toOffline(teiRelationship);
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TeiRelationship>> getTeirelationShips(
    String fromTeiId,
  ) async {
    List<TeiRelationship> teiRelationships = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [
          id,
          relationshipType,
          fromTei,
          toTei,
        ],
        where: '$fromTei = ?',
        whereArgs: [fromTeiId],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          teiRelationships.add(TeiRelationship.fromOffline(map));
        }
      }
    } catch (e) {}
    return teiRelationships;
  }
}
