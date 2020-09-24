import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:sqflite/sqflite.dart';

class TrackedEntityInstanceOfflineAttributeProvider extends OfflineDbProvider {
  final String table = 'tracked_entity_instance_attribute';
  //columns
  final String id = 'id';
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String attribute = 'attribute';
  final String value = 'value';

  addOrUpdateEventDataValues(
    TrackeEntityInstance trackedEntityInstanceData,
  ) async {
    var dbClient = await db;
    try {
      List attributes = trackedEntityInstanceData.attributes as List<dynamic>;
      String trackedEntityInstance =
          trackedEntityInstanceData.trackedEntityInstance;
      for (Map attributeObj in attributes) {
        String attribute = attributeObj['attribute'];
        Map data = Map<String, dynamic>();
        data['id'] = '$trackedEntityInstance-$attribute';
        data['trackedEntityInstance'] = trackedEntityInstance;
        data['attribute'] = attribute;
        data['value'] = attributeObj['value'] ?? '';
        await dbClient.insert(table, data,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
