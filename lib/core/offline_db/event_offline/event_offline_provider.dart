import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_data_value.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
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

  addOrUpdateMultipleEvents(List<dynamic> events) async {
    var dbClient = await db;
    List<List<dynamic>> chunkedEvents =
        AppUtil().chunkItems(items: events, size: 100);
    for (List<dynamic> eventsGroup in chunkedEvents) {
      var eventBatch = dbClient.batch();
      for (dynamic event in eventsGroup) {
        Map data = Events().toOffline(event);
        data['id'] = data['event'];
        data.remove('dataValues');
        eventBatch.insert(table, data,
            conflictAlgorithm: ConflictAlgorithm.replace);
        await EventOfflineDataValueProvider().addOrUpdateEventDataValues(event);
      }

      await eventBatch.commit(
          exclusive: true, noResult: true, continueOnError: true);
    }
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
      {List<String> eventList = const []}) async {
    List<Events> events = [];
    try {
      var dbClient = await db;
      String questionMarks = eventList.map((e) => '?').toList().join(',');
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
        where: eventList.isEmpty
            ? '$syncStatus = ?'
            : '$event IN ($questionMarks)',
        whereArgs: eventList.isEmpty ? [eventSyncStatus] : [...eventList],
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

  Future<int> getOfflineEventCount(String programId, String orgUnitId) async {
    int offlineEventsCount;
    try {
      var dbClient = await db;
      offlineEventsCount = Sqflite.firstIntValue(await dbClient.rawQuery(
          'SELECT COUNT(*) FROM $table WHERE $program = ? AND $orgUnit = ?',
          ['$programId', '$orgUnitId']));
    } catch (e) {}
    return offlineEventsCount ?? 0;
  }
}
