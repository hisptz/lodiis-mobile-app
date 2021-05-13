import 'dart:convert';

import 'package:http/http.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationService {
  final String apiUrlToDataStore = "api/dataStore/kb-referral-notification";

  discoveringAndSaveReferralNotificationFromServer() async {
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      HttpService httpService = HttpService(
        username: currentUser.username,
        password: currentUser.password,
      );
      String implementingPartner =
          currentUser.implementingPartner.split("/").join("-");
      Response response = await httpService.httpGet(
        apiUrlToDataStore,
        queryParameters: {},
      );
      List<String> keysForReferralNotification = getKeysForReferralNofification(
        response,
        implementingPartner,
      );
      List<ReferralNotification> referralNotifications =
          await getReferralNotificationFromServer(
              keysForReferralNotification, httpService);
      await ReferralNotificationOfflineProvider()
          .addOrUpdateReferralNotification(referralNotifications);
    } catch (error) {
      print("errror : $error");
    }
  }

  Future<List<ReferralNotification>> getReferralNotificationFromServer(
    List<String> keysForReferralNotification,
    HttpService httpService,
  ) async {
    List<ReferralNotification> referralNofications = [];
    try {
      for (String nameSpaceKey in keysForReferralNotification) {
        Response response = await httpService.httpGet(
          "$apiUrlToDataStore/$nameSpaceKey",
          queryParameters: {},
        );
        for (Map data in json.decode(response.body)) {
          referralNofications.add(ReferralNotification.fromJson(data));
        }
      }
    } catch (error) {
      print("error : $error");
    }
    return referralNofications;
  }

  List<String> getKeysForReferralNofification(
    Response response,
    String implementingPartner,
  ) {
    List<String> selectedKeys = [];
    try {
      for (String key in json.decode(response.body)) {
        if (key.contains(implementingPartner)) {
          selectedKeys.add(key);
        }
      }
    } catch (error) {
      print("error : $error");
    }
    return selectedKeys;
  }
}
