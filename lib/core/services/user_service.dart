import 'dart:convert';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class UserService {
  Future<dynamic> login(String username, String password) async {
    var url = 'api/me.json?fields=*';
    HttpService http = new HttpService(username: username, password: password);

    var response = await http.httpGet(url);
    return response.statusCode == 200
        ? CurrentUser.fromJson(json.decode(response.body), username, password)
        : null;
  }

  Future logout(String username, String password) async {}

  Future<CurrentUser> getCurrentUser() {
    return null;
  }

  setCurrentUser(CurrentUser user) async {}
}
