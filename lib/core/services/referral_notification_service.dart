import 'dart:convert';

import 'package:http/http.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_event_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationService {
  final String apiUrlToDataStore = "api/dataStore/kb-referral-notification";

  Future syncReferralNotifications() async {
    try {
      // @TODO implemententions missing
      List<ReferralNotification> onlineReferralNotifications =
          await discoveringReferralNotificationFromServer();
      List<ReferralNotification> offlineReferralNotifications =
          await getReferralNotificationFromOffline();

      print(onlineReferralNotifications);
      print("\n");
      print(offlineReferralNotifications);
      // sorting diff
      // update local
      // update online data
      updateReferralNotificationToServer(offlineReferralNotifications);
    } catch (error) {
      print(error.toString());
    }
  }

  savingReferralNotificationToOfflineDb(
    List<ReferralNotification> referralNotifications,
  ) async {
    try {
      await ReferralNotificationOfflineProvider()
          .addOrUpdateReferralNotification(referralNotifications);
    } catch (errro) {}
  }

  updateReferralNotificaionEvent(String referralEventId, String tei) async {
    try {
      List<ReferralEventNotification> referralEvents =
          await ReferralEventNotificationOfflineProvider()
              .getReferralEventNotification([tei]);
      for (ReferralEventNotification referralEventNotification
          in referralEvents) {
        if (referralEventNotification.id == referralEventId) {
          referralEventNotification.isCompleted = true;
          ReferralEventNotificationOfflineProvider()
              .addOrUpdateReferralEventNotification(
                  [referralEventNotification]);
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }

  updateReferralNotificationToServer(
    List<ReferralNotification> referralNotifications,
  ) async {
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      HttpService httpService = HttpService(
        username: currentUser.username,
        password: currentUser.password,
      );
      List<String> nameSpaceKeys = (referralNotifications
              .map((ReferralNotification referralNotification) =>
                  referralNotification.nameSpaceKey)
              .toList())
          .toSet()
          .toList();
      for (String nameSpaceKey in nameSpaceKeys) {
        String url = "$apiUrlToDataStore/$nameSpaceKey";
        var jsonData = referralNotifications
            .map((ReferralNotification referralNotification) =>
                referralNotification.toJson())
            .toList();
        await httpService.httpDelete(url, queryParameters: {});
        await httpService.httpPost(
          "$apiUrlToDataStore/$nameSpaceKey",
          json.encode(jsonData),
          queryParameters: {},
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<ReferralNotification>>
      getReferralNotificationFromOffline() async {
    List<ReferralNotification> referralNofications = [];
    try {
      referralNofications = await ReferralNotificationOfflineProvider()
          .getReferralNotifications();
    } catch (error) {
      print(error.toString());
    }
    return referralNofications;
  }

  Future<List<ReferralNotification>>
      discoveringReferralNotificationFromServer() async {
    List<ReferralNotification> referralNotifications = [];
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
      referralNotifications = await getReferralNotificationFromServer(
        keysForReferralNotification,
        httpService,
      );
    } catch (error) {
      print(error.toString());
    }
    return referralNotifications;
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
