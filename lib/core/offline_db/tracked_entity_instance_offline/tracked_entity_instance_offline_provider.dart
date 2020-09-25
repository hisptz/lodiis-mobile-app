import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:sqflite/sqflite.dart';

class TrackedEntityInstanceOfflineProvider extends OfflineDbProvider {
  final String table = 'tracked_entity_instance';
  //columns
  final String id = 'id';
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String trackedEntityType = 'trackedEntityType';
  final String orgUnit = 'orgUnit';
  final String syncStatus = 'syncStatus';

  addOrUpdateTrackedEntityInstance(
    TrackeEntityInstance trackedEntityInstance,
  ) async {
    var dbClient = await db;
    Map data = TrackeEntityInstance().toOffline(trackedEntityInstance);
    data.remove('attributes');
    data['id'] = data['trackedEntityInstance'];
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await TrackedEntityInstanceOfflineAttributeProvider()
        .addOrUpdateTrackedEntityAttributesValues(trackedEntityInstance);
  }

  Future<List<TrackeEntityInstance>> getTrackedEntityInstance(
    List<String> trackedEntityInstanceIds,
  ) async {
    List<TrackeEntityInstance> trackedEntityInstances = [];
    try {
      var dbClient = await db;
      for (String trackedEntityInstanceId in trackedEntityInstanceIds) {
        List<Map> maps = await dbClient.query(
          table,
          columns: [
            trackedEntityInstance,
            trackedEntityType,
            orgUnit,
            syncStatus,
          ],
          where: '$trackedEntityInstance = ?',
          whereArgs: [trackedEntityInstanceId],
        );
        if (maps.isNotEmpty) {
          for (Map map in maps) {
            List attributes =
                await TrackedEntityInstanceOfflineAttributeProvider()
                    .getTrackedEntityAttributesValues(trackedEntityInstanceId);
            TrackeEntityInstance tei = TrackeEntityInstance.fromOffline(map);
            tei.attributes = attributes;
            trackedEntityInstances.add(tei);
          }
        }
      }
    } catch (e) {}
    return trackedEntityInstances;
  }
}
