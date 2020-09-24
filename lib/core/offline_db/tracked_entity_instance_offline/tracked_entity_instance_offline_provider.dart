import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:sqflite/sqflite.dart';

class TrackedEntityInstanceOfflineProvider extends OfflineDbProvider {
  final String table = 'tracked_entity_instance';
  //columns
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String trackedEntityType = 'trackedEntityType';
  final String orgUnit = 'orgUnit';
  final String syncStatus = 'syncStatus';

  addOrUpdateTrackedEntityInstance(
    TrackeEntityInstance trackedEntityInstance,
  ) async {
    var dbClient = await db;
    var data = TrackeEntityInstance().toOffline(trackedEntityInstance);
    data.remove('attributes');
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await TrackedEntityInstanceOfflineAttributeProvider()
        .addOrUpdateEventDataValues(trackedEntityInstance);
  }
}
