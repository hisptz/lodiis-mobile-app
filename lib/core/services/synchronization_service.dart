import 'package:kb_mobile_app/core/services/http_service.dart';

class SynchronizationService {
  HttpService httpClient;

  final List<String> programs = [];

  SynchronizationService(String username, String password) {
    httpClient = HttpService(username: username, password: password);
  }

  Future uploadBenefiariesToTheServer() async {}

  Future downloadBenefiariesToTheServer() async {}

  Future getTeisFromOfflineDb() async {}

  Future getTeiEnrollmentFromOfflineDb() async {}

  Future getTeiRelationShipFromOfflineDb() async {}

  Future getTeiEventsFromOfflineDb() async {}

  Future uploadTeisToTheServer() async {}

  Future uploadTeiEnrollmentToTheServer() async {}

  Future uploadTeiEventsToTheServer() async {}

  Future uploadTeiRelationToTheServer() async {}
}
