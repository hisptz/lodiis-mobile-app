import 'dart:convert';

import 'package:http/http.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationService {
  final String dataStoreNameSpace = "kb-referral-notification";

  discoveringAndSaveReferralNotificationFromServer() async {
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      HttpService httpService = HttpService(
        username: currentUser.username,
        password: currentUser.password,
      );
      String implementingPartner =
          currentUser.implementingPartner.split("/").join("-");
      String url = "api/dataStore/$dataStoreNameSpace";
      Response response = await httpService.httpGet(url, queryParameters: {});
      List<String> keysForReferralNotification = getKeysForReferralNofification(
        response,
        implementingPartner,
      );
      print(keysForReferralNotification);
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
      Response response = null;
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
