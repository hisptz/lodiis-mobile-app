import 'dart:convert';

import 'package:kb_mobile_app/core/constants/default_user_access.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';

class UserAccess {
  final String url = "api/dataStore/kb-mobile-app/user-access";

  Future<dynamic> getUserAccessConfigurationsFromTheServer(
    String username,
    String password,
  ) async {
    String defaultUserAccessConfigs = DefaultUserAccess.getDefaultUserAccess();
    String currentUserAccessConfigs = "";
    try {
      HttpService http =
          new HttpService(username: username, password: password);
      var response = await http.httpGet(url);
      currentUserAccessConfigs =
          response.statusCode == 200 ? response.body : defaultUserAccessConfigs;
    } catch (error) {}
    return json.decode(currentUserAccessConfigs);
  }

  Future savingUserAccessConfigurations(userAccessConfigs) async {
    print(userAccessConfigs.keys.toList());
    try {
      //@TODO actual implementations
    } catch (error) {}
  }

  Future getSavedUserAccessConfigurations() async {
    String defaultUserAccessConfigs = DefaultUserAccess.getDefaultUserAccess();
    try {
      //@TODO actual implementations
    } catch (error) {}
    return json.decode(defaultUserAccessConfigs);
  }
}
