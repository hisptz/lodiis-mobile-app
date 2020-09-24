import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:sqflite/sqflite.dart';

class EventOfflineDataValueProvider extends OfflineDbProvider {
  final String table = 'event_data_value';
  //columns
  final String id = 'id';
  final String event = 'event';
  final String dataElement = 'dataElement';
  final String value = 'program';

  addOrUpdateEventDataValues(Events eventData) async {
    var dbClient = await db;
    try {
      List dataValues = eventData.dataValues as List<dynamic>;
      String event = eventData.event;
      for (Map dataValue in dataValues) {
        String dataElement = dataValue['dataElement'];
        Map data = Map<String, dynamic>();
        data['id'] = '$event-$dataElement';
        data['event'] = event;
        data['dataElement'] = dataElement;
        data['value'] = dataValue['value'] ?? '';
        await dbClient.insert(table, data,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
