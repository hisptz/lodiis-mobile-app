import 'dart:convert';

import 'package:http/http.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_event_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationService {
  final String apiUrlToDataStore = "api/dataStore/kb-referral-notification";

  Future syncReferralNotifications() async {
    try {
      List<ReferralNotification> onlineReferralNotifications =
          await discoveringReferralNotificationFromServer();
      List<ReferralNotification> offlineReferralNotifications =
          await getReferralNotificationFromOffline();
      List<ReferralNotification> referralNotifications =
          getMergedReferralNotififcations(
              onlineReferralNotifications, offlineReferralNotifications);
      await savingReferralNotificationToOfflineDb(referralNotifications);
      await updateReferralNotificationToServer(referralNotifications);
    } catch (error) {
      print("syncReferralNotifications : ${error.toString()}");
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

  updateReferralNotificaionEvent(
    String referralEventId,
    String tei,
    bool isCompleted,
    bool isViewed,
  ) async {
    try {
      List<ReferralEventNotification> referralEvents =
          await ReferralEventNotificationOfflineProvider()
              .getReferralEventNotification([tei]);
      for (ReferralEventNotification referralEventNotification
          in referralEvents) {
        if (referralEventNotification.id == referralEventId) {
          referralEventNotification.isCompleted = isCompleted;
          referralEventNotification.isViewed = isViewed;
          ReferralEventNotificationOfflineProvider()
              .addOrUpdateReferralEventNotification(
                  [referralEventNotification]);
        }
      }
    } catch (error) {
      print("updateReferralNotificaionEvent : ${error.toString()}");
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
        var jsondata = (referralNotifications
                .where((ReferralNotification referralNotification) =>
                    referralNotification.nameSpaceKey == nameSpaceKey)
                .toList())
            .map((ReferralNotification referralNotification) =>
                referralNotification.toOffline(
                  shoulTransaformBoolenValues: true,
                ))
            .toList();
        await httpService.httpDelete(url, queryParameters: {});
        await httpService.httpPost(
          "$apiUrlToDataStore/$nameSpaceKey",
          json.encode(jsondata),
          queryParameters: {},
        );
      }
    } catch (error) {
      print("updateReferralNotificationToServer : ${error.toString()}");
    }
  }

  Future<List<ReferralNotification>>
      getReferralNotificationFromOffline() async {
    List<ReferralNotification> referralNofications = [];
    try {
      referralNofications = await ReferralNotificationOfflineProvider()
          .getReferralNotifications();
    } catch (error) {
      print("getReferralNotificationFromOffline : ${error.toString()}");
    }
    return referralNofications;
  }

  Future<List<ReferralNotification>>
      discoveringReferralNotificationFromServer() async {
    List<ReferralNotification> referralNotifications = [];
    List<String> locations = [];
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      HttpService httpService = HttpService(
        username: currentUser.username,
        password: currentUser.password,
      );
      for (String organisationUnitId in currentUser.userOrgUnitIds) {
        locations.addAll(await OrganisationUnitService()
            .getOrganisationUnitsInPathByOrganisationUnit(organisationUnitId));
      }
      locations = locations.toSet().toList();
      String implementingPartner =
          currentUser.implementingPartner.split("/").join("-").trim();
      Response response = await httpService.httpGet(
        apiUrlToDataStore,
        queryParameters: {},
      );
      List<String> keysForReferralNotification = getKeysForReferralNofification(
        response,
        implementingPartner,
        locations.toSet().toList(),
      );
      referralNotifications = await getReferralNotificationFromServer(
        keysForReferralNotification,
        httpService,
      );
    } catch (error) {
      print("discoveringReferralNotificationFromServer : ${error.toString()}");
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
      print("discoveringReferralNotificationFromServer : ${error.toString()}");
    }
    return referralNofications;
  }

  List<String> getKeysForReferralNofification(
    Response response,
    String implementingPartner,
    List<String> locations,
  ) {
    List<String> selectedKeys = [];
    try {
      if (locations.isEmpty) {
        for (String key in json.decode(response.body)) {
          if (key.indexOf(implementingPartner) > -1) {
            selectedKeys.add(key);
          }
        }
      } else {
        for (String key in json.decode(response.body)) {
          for (String location in locations) {
            if (key.indexOf(location) > -1) {
              selectedKeys.add(key);
            }
          }
        }
      }
    } catch (error) {
      print("getKeysForReferralNofification : ${error.toString()}");
    }
    return selectedKeys;
  }

  List<ReferralNotification> getMergedReferralNotififcations(
    List<ReferralNotification> onlineReferralNotifications,
    List<ReferralNotification> offlineReferralNotifications,
  ) {
    List<ReferralNotification> referralNotifications = [];
    try {
      List<String> offlineReferralNotificationIds = offlineReferralNotifications
          .map((ReferralNotification referralNotification) =>
              referralNotification.id)
          .toList();
      List<String> conflictReferralNotificationIds =
          (onlineReferralNotifications
                  .map((ReferralNotification referralNotification) =>
                      referralNotification.id)
                  .toList())
              .where((String id) => offlineReferralNotificationIds.contains(id))
              .toList()
              .toSet()
              .toList();
      referralNotifications.addAll(onlineReferralNotifications
          .where((ReferralNotification referralNotification) =>
              conflictReferralNotificationIds
                  .indexOf(referralNotification.id) ==
              -1)
          .toList());
      referralNotifications.addAll(offlineReferralNotifications
          .where((ReferralNotification referralNotification) =>
              conflictReferralNotificationIds
                  .indexOf(referralNotification.id) ==
              -1)
          .toList());
      for (String id in conflictReferralNotificationIds) {
        ReferralNotification onlineReferralNotification =
            onlineReferralNotifications.firstWhere(
                (ReferralNotification referralNotification) =>
                    referralNotification.id == id);
        ReferralNotification offlineReferralNotification =
            offlineReferralNotifications.firstWhere(
                (ReferralNotification referralNotification) =>
                    referralNotification.id == id);
        List<ReferralEventNotification> referrals =
            getMergedReferralEventNotififcations(
                onlineReferralNotification.referrals,
                offlineReferralNotification.referrals);
        referralNotifications.add(ReferralNotification(
          id: id,
          implementingPartner: onlineReferralNotification.implementingPartner,
          nameSpaceKey: onlineReferralNotification.nameSpaceKey,
          tei: onlineReferralNotification.tei,
          referrals: referrals,
        ));
      }
    } catch (error) {
      print("getMergedReferralNotififcations : ${error.toString()}");
    }
    return referralNotifications;
  }

  List<ReferralEventNotification> getMergedReferralEventNotififcations(
    List<ReferralEventNotification> onlineReferrals,
    List<ReferralEventNotification> offlineReferrals,
  ) {
    List<ReferralEventNotification> referrals = [];
    try {
      List<String> offlineReferralIds = offlineReferrals
          .map((ReferralEventNotification referralEventNotification) =>
              referralEventNotification.id)
          .toList();
      List<String> conflictReferralIds = (onlineReferrals
              .map((ReferralEventNotification referralEventNotification) =>
                  referralEventNotification.id)
              .toList())
          .where((String id) => offlineReferralIds.contains(id))
          .toList()
          .toSet()
          .toList();
      referrals.addAll(onlineReferrals
          .where((ReferralEventNotification referralEventNotification) =>
              conflictReferralIds.indexOf(referralEventNotification.id) == -1)
          .toList());
      referrals.addAll(offlineReferrals
          .where((ReferralEventNotification referralEventNotification) =>
              conflictReferralIds.indexOf(referralEventNotification.id) == -1)
          .toList());
      for (String id in conflictReferralIds) {
        ReferralEventNotification onlineReferral = onlineReferrals.firstWhere(
            (ReferralEventNotification referralEventNotification) =>
                referralEventNotification.id == id);
        ReferralEventNotification offlineReferral = offlineReferrals.firstWhere(
            (ReferralEventNotification referralEventNotification) =>
                referralEventNotification.id == id);
        if (offlineReferral.isViewed) {
          referrals.add(offlineReferral);
        } else if (onlineReferral.isViewed) {
          referrals.add(onlineReferral);
        } else if (onlineReferral.isCompleted) {
          referrals.add(onlineReferral);
        } else {
          referrals.add(offlineReferral);
        }
      }
    } catch (error) {
      print("getMergedReferralEventNotififcations : ${error.toString()}");
    }
    return referrals;
  }
}
