import 'package:kb_mobile_app/core/services/http_service.dart';

class SynchronizationService {
  HttpService httpClient;

  SynchronizationService(String username, String password) {
    httpClient = HttpService(username: username, password: password);
  }
}
