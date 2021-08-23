import 'dart:convert';

import 'package:kb_mobile_app/core/constants/default_user_access.dart';
import 'package:kb_mobile_app/core/offline_db/user_access_offline/user_access_offline.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';

class UserAccess {
  final String url = "api/dataStore/kb-mobile-app/user-access";
  final String userAccessId = "user-access";

  Future<dynamic> getUserAccessConfigurationsFromTheServer(
    String? username,
    String? password,
  ) async {
    String defaultUserAccessConfigs = DefaultUserAccess.getDefaultUserAccess();
    dynamic currentUserAccessConfigs = "";
    try {
      HttpService http = new HttpService(
        username: username,
        password: password,
      );
      var response = await http.httpGet(url);
      currentUserAccessConfigs =
          response.statusCode == 200 ? response.body : defaultUserAccessConfigs;
    } catch (error) {}
    return json.decode(currentUserAccessConfigs);
  }

  Future<void> savingUserAccessConfigurations(userAccessConfigs) async {
    try {
      String userAccessData = json.encode(userAccessConfigs);
      await UserAccessOfflineProvider()
          .addOrUpdateUserAccess(userAccessId, userAccessData);
    } catch (error) {}
  }

  Future getSavedUserAccessConfigurations() async {
    String defaultUserAccessConfigs = DefaultUserAccess.getDefaultUserAccess();
    dynamic currentUserAccessConfigs;
    try {
      currentUserAccessConfigs = await UserAccessOfflineProvider()
          .getAllUserAccessConfigurationById(userAccessId);
      currentUserAccessConfigs = currentUserAccessConfigs != null
          ? currentUserAccessConfigs
          : defaultUserAccessConfigs;
    } catch (error) {
      print("error : $error");
    }
    return json.decode(currentUserAccessConfigs);
  }
}
