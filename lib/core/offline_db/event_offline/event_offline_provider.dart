import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_data_value.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:sqflite/sqflite.dart';

class EventOfflineProvider extends OfflineDbProvider {
  final String table = 'events';
  //columns
  final String id = 'id';
  final String event = 'event';
  final String eventDate = 'eventDate';
  final String program = 'program';
  final String programStage = 'programStage';
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String status = 'status';
  final String orgUnit = 'orgUnit';
  final String syncStatus = 'syncStatus';

  addOrUpdateEvent(Events event) async {
       var dbClient = await db;
    Map data = Events().toOffline(event);
    data['id'] = data['event'];
    data.remove('dataValues');
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    await EventOfflineDataValueProvider().addOrUpdateEventDataValues(event);
  }

  Future<List<Events>> getTrackedEntityInstanceEvents(
    List<String> trackedEntityInstanceIds,
  ) async {
    List<Events> events = [];
    try {
      var dbClient = await db;
      for (String trackedEntityInstanceId in trackedEntityInstanceIds) {
        List<Map> maps = await dbClient.query(
          table,
          columns: [
            id,
            event,
            eventDate,
            program,
            programStage,
            trackedEntityInstance,
            status,
            orgUnit,
            syncStatus,
          ],
          where: '$trackedEntityInstance = ?',
          whereArgs: [trackedEntityInstanceId],
        );
        if (maps.isNotEmpty) {
          for (Map map in maps) {
            List dataValues = await EventOfflineDataValueProvider()
                .getEventDataValues(map['id']);
            Events eventData = Events.fromOffline(map);
            eventData.dataValues = dataValues;
            events.add(eventData);
          }
        }
      }
    } catch (e) {}
    return events..sort((b, a) => a.eventDate.compareTo(b.eventDate));
  }

  Future<List<Events>> getTrackedEntityInstanceEventsByStatus(
    String eventSyncStatus,
  ) async {
    List<Events> events = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [
          id,
          event,
          eventDate,
          program,
          programStage,
          trackedEntityInstance,
          status,
          orgUnit,
          syncStatus,
        ],
        where: '$syncStatus = ?',
        whereArgs: [eventSyncStatus],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          List dataValues = await EventOfflineDataValueProvider()
              .getEventDataValues(map['id']);
          Events eventData = Events.fromOffline(map);
          eventData.dataValues = dataValues;
          events.add(eventData);
        }
      }
    } catch (e) {}
    return events..sort((b, a) => a.eventDate.compareTo(b.eventDate));
  }
}
