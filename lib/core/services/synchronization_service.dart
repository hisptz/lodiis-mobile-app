import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
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

  Future uploadBenefiariesToTheServer() async {
    // get offline data and upload to system
  }

  Future downloadBenefiariesToTheServer() async {
    // Download by programs
    // get payloads the save to offline db;
    // https://play.dhis2.org/2.34.1/api/trackedEntityInstances.json?ouMode=DESCENDANTS&ou=ImspTQPwCqd&totalPages=true&pageSize=10&fields=
    // https://play.dhis2.org/2.34.1/api/events.json?ouMode=DESCENDANTS&ou=ImspTQPwCqd&totalPages=true&pageSize=10&fields=

    // https://play.dhis2.org/2.34.1/api/events.json?ouMode=DESCENDANTS&orgUnit=ImspTQPwCqd&totalPages=true&pageSize=10

    //  events[event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value]]
    // trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status]
    // fields=trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status,events[event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value]]]
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

  Future uploadTeisToTheServer() async {}

  Future uploadTeiEnrollmentToTheServer() async {}

  Future uploadTeiEventsToTheServer() async {}

  Future uploadTeiRelationToTheServer() async {}
}
