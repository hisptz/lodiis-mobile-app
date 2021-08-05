import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/offline_db/program_ou_offline/program_ou_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_ou_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_program_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class UserService {
  final String preferenceKey = 'current_user';

  Future<CurrentUser> login({
    @required String username,
    @required String password,
    isOnlineAuthentication = true,
  }) async {
    CurrentUser user;
    try {
      if (isOnlineAuthentication) {
        var url = 'api/me.json';
        var queryParameters = {
          "fields":
              "id,name,email,phoneNumber,programs,organisationUnits[id],attributeValues[value,attribute[id]],userGroups[name],userCredentials[userRoles[name]]"
        };
        HttpService http = new HttpService(
          username: username,
          password: password,
        );
        var response =
            await http.httpGet(url, queryParameters: queryParameters);
        if (response.statusCode == 200) {
          user = CurrentUser.fromJson(
            json.decode(response.body),
            username,
            password,
          );
        }
      } else {
        List<CurrentUser> users = await UserOfflineProvider().getUsers();
        try {
          user = users.firstWhere((CurrentUser user) =>
              user.username == username && user.password == password);
        } catch (error) {
          String message =
              "You can not login offline with provided username and password, kindly connect to network and try again";
          throw message;
        }
      }
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future logout() async {
    CurrentUser user = await getCurrentUser();
    if (user != null) {
      user.isLogin = false;
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

  resetUserAssociatedMetadata(String userId) async {
    await UserOuOfflineProvider().deleteUserOrganisationUnits(userId);
    await UserProgramOfflineProvider().deleteUserPrograms(userId);
    await ProgramOuOfflineProvider().clearProgramOrganisationUnits();
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
