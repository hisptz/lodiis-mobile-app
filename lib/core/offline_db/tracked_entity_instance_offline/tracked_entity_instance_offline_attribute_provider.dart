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

  addOrUpdateTrackedEntityAttributesValues(
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
    } catch (e) {}
  }

  addOrUpdateMultipleTrackedEntityInstanceAttributes(List attributes) async {
    var dbClient = await db;
    var attributesBatch = dbClient.batch();
    try {
      for (var attribute in attributes) {
        attributesBatch.insert(table, attribute,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await attributesBatch.commit(
          exclusive: true, noResult: true, continueOnError: true);
    } catch (e) {
      print(e);
    }
  }

  List getTrackedEntityAttributes(TrackeEntityInstance trackedEntityInstance) {
    List attributes = trackedEntityInstance.attributes as List<dynamic>;
    List attributesObjects = [];
    try {
      String trackedEntityInstanceId =
          trackedEntityInstance.trackedEntityInstance;
      for (Map attributeObj in attributes) {
        String attribute = attributeObj['attribute'];
        Map data = Map<String, dynamic>();
        data['id'] = '$trackedEntityInstance-$attribute';
        data['trackedEntityInstance'] = trackedEntityInstanceId;
        data['attribute'] = attribute;
        data['value'] = attributeObj['value'] ?? '';
        attributesObjects.add(data);
      }
    } catch (e) {}

    return attributesObjects;
  }

  Future<List> getTrackedEntityAttributesValues(
    String trackedEntityInstanceId,
  ) async {
    List attributes = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [attribute, value],
        where: '$trackedEntityInstance = ?',
        whereArgs: [trackedEntityInstanceId],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          attributes.add(map);
        }
      }
    } catch (e) {}
    return attributes;
  }

  Future<List> getTrackedEntityAttributesValuesById(
    List<String> attributeIds,
  ) async {
    List attributes = [];
    try {
      var dbClient = await db;
      String questionMarks = attributeIds.map((e) => '?').toList().join(',');
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, trackedEntityInstance, attribute, value],
        where: '$attribute IN ($questionMarks)',
        whereArgs: attributeIds,
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          attributes.add(map);
        }
      }
    } catch (e) {}
    return attributes;
  }
}
