import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class SynchronizationService {
  HttpService httpClient;

  final List<String> programs = [];
  final String offlineSyncStatus = 'not-synced';
  final String onlineSyncStatus = 'synced';

  SynchronizationService(String username, String password) {
    httpClient = HttpService(username: username, password: password);
  }

  Future downloadBenefiariesToTheServer() async {
    // Download by programs
    // get payloads the save to offline db;
    // get tracked entity instances and enrollment payload
    //https://lsis-ovc-dreams.org/api/trackedEntityInstances.json?ouMode=DESCENDANTS&ou=j1R4h0Twe27&program=hOEIHJDrrvz&totalPages=true&pageSize=10&fields=trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status]

    // Getting events data
    //https://lsis-ovc-dreams.org/api/events.json?ouMode=DESCENDANTS&orgUnit=j1R4h0Twe27&program=hOEIHJDrrvz&totalPages=true&pageSize=10&fields=event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value]
  }

  Future<List<TrackeEntityInstance>> getTeisFromOfflineDb() async {
    return await TrackedEntityInstanceOfflineProvider()
        .getTrackedEntityInstanceByStatus(offlineSyncStatus);
  }

  Future<List<Enrollment>> getTeiEnrollmentFromOfflineDb() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentByStatus(offlineSyncStatus);
  }

  Future<List<TeiRelationship>> getTeiRelationShipFromOfflineDb() async {
    return await TeiRelatioShipOfflineProvider().getAllTeiRelationShips();
  }

  Future<List<Events>> getTeiEventsFromOfflineDb() async {
    return await EventOfflineProvider()
        .getTrackedEntityInstanceEventsByStatus(offlineSyncStatus);
  }

  Future uploadTeisToTheServer(
    List<TrackeEntityInstance> teis,
    List<Enrollment> teiEnrollments,
  ) async {
    List<String> syncedIds = [];
    String url = 'api/trackedEntityInstances?strategy=CREATE_AND_UPDATE';
    Map body = Map();
    var enrollments = teiEnrollments
        .map((enrollment) => enrollment.toOffline(enrollment))
        .toList();
    body['trackedEntityInstances'] = teis.map((tei) {
      var data = tei.toOffline(tei);
      String trackedEntityInstance = data['trackedEntityInstance'];
      data['enrollments'] = enrollments
          .where((enrollment) =>
              enrollment['trackedEntityInstance'] == trackedEntityInstance)
          .toList();
      return data;
    }).toList();
    var response = await httpClient.httpPost(url, json.encode(body));
    try {
      syncedIds = _getReferenceids(json.decode(response.body));
    } catch (e) {}
    if (syncedIds.length > 0) {
      for (TrackeEntityInstance tei in teis) {
        if (syncedIds.indexOf(tei.trackedEntityInstance) > -1) {
          tei.syncStatus = 'synced';
          FormUtil.savingTrackeEntityInstance(tei);
        }
      }
      for (Enrollment teiEnrollment in teiEnrollments) {
        if (syncedIds.indexOf(teiEnrollment.trackedEntityInstance) > -1) {
          teiEnrollment.syncStatus = 'synced';
          FormUtil.savingEnrollment(teiEnrollment);
        }
      }
    }
  }

  Future uploadTeiEventsToTheServer(
    List<Events> teiEvents,
  ) async {
    List<String> syncedIds = [];
    String url = 'api/events?strategy=CREATE_AND_UPDATE';
    Map body = Map();
    body['events'] = teiEvents.map((event) {
      var data = event.toOffline(event);
      if (data['trackedEntityInstance'] == null ||
          data['trackedEntityInstance'] == '') {
        data.remove('trackedEntityInstance');
      }
      return data;
    }).toList();
    var response = await httpClient.httpPost(url, json.encode(body));
    try {
      syncedIds = _getReferenceids(json.decode(response.body));
    } catch (e) {}
    if (syncedIds.length > 0) {
      for (Events event in teiEvents) {
        if (syncedIds.indexOf(event.event) > -1) {
          event.syncStatus = 'synced';
          FormUtil.savingEvent(event);
        }
      }
    }
  }

  Future uploadTeiRelationToTheServer(
    List<TeiRelationship> teiRelationShips,
  ) async {
    print('teiRelationShips $teiRelationShips');
  }

  List<String> _getReferenceids(Map body) {
    List<String> referenceIds = [];
    var bodyResponse = body['response'];
    var importSummaries = bodyResponse['importSummaries'] ?? [];
    for (var importSummary in importSummaries) {
      if (importSummary['status'] == 'SUCCESS' &&
          importSummary['reference'] != null) {
        referenceIds.add(importSummary['reference']);
      } else {
        //@TODO add logs
        print(json.encode(importSummary));
      }
    }
    return referenceIds;
  }
}
