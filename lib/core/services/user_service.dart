import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/program_ou_offline/program_ou_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_ou_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_program_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class UserService {
  final String preferenceKey = 'currrent_user';

  Future<dynamic> login(
    String username,
    String password,
  ) async {
    try {
      var url = 'api/me.json';
      var queryParameters = {
        "fields":
            "id,name,programs,organisationUnits[id],attributeValues[value,attribute[id,name]]"
      };
      HttpService http = new HttpService(
        username: username,
        password: password,
      );
      var response = await http.httpGet(url, queryParameters: queryParameters);
      return response.statusCode == 200
          ? CurrentUser.fromJson(
              json.decode(response.body),
              username,
              password,
            )
          : null;
    } catch (e) {
      throw e;
    }
  }

  Future logout() async {
    CurrentUser user = await getCurrentUser();
    if (user != null) {
      user.isLogin = false;
      user.password = '';
      user.userOrgUnitIds = [];
      user.programs = [];
      await UserOuOfflineProvider().deleteUserOrganisationUnits(user.id);
      await UserProgramOfflineProvider().deleteUserPrograms(user.id);
      await ProgramOuOfflineProvider().clearProgramOrganisationUnits();
      await setCurrentUser(user);
    }
  }

  Future<CurrentUser> getCurrentUser() async {
    String userId = await PreferenceProvider.getPreferenceValue(preferenceKey);
    List<CurrentUser> users = await UserOfflineProvider().getUsers();
    List<CurrentUser> filteredUsers =
        users.where((CurrentUser user) => user.id == userId).toList();
    return filteredUsers.length > 0 ? filteredUsers[0] : null;
  }

  setCurrentUser(
    CurrentUser user,
  ) async {
    await UserOfflineProvider().addOrUpdateUser(user);
    await PreferenceProvider.setPreferenceValue(
      preferenceKey,
      user.id,
    );
  }
}
