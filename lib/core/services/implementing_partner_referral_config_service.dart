import 'dart:convert';
import 'package:kb_mobile_app/core/constants/default_implementing_partner_referral_service.dart';
import 'package:kb_mobile_app/core/offline_db/implementing_partner_referral_services_offline/implementing_partner_referral_services_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/models/implementing_partner_referral_service.dart';

class ImplementingPartnerReferralConfigService {
  final String url = "api/dataStore/kb-mobile-app/referral-services";

  Future<dynamic> getImplementingPartnerReferralServicesFromTheServer(
    String username,
    String password,
  ) async {
    String defaultReferralServices =
        DefaultImplementingPartnerReferralServices.getDefaultService();
    String currentReferralServices = '';

    try {
      HttpService http = new HttpService(
        username: username,
        password: password,
      );
      var response = await http.httpGet(url);
      currentReferralServices =
          response.statusCode == 200 ? response.body : defaultReferralServices;
    } catch (error) {
      print(
          'getImplementingPartnerReferralServicesFromTheServer: ${error.toString()}');
    }
    return currentReferralServices;
  }

  Future<void> checkOfflineImplementingPartnerReferralServices() async {
    bool referralJsonData =
        await ImplementingPartnerReferralServicesOfflineProvider()
            .checkIfImplementingPartnerReferralServicesExist();
    if (!referralJsonData) {
      ImplementingPartnerReferralService implementingPartnerReferralService =
          new ImplementingPartnerReferralService(
              id: DefaultImplementingPartnerReferralServices.referralServicesId,
              services: DefaultImplementingPartnerReferralServices
                  .getDefaultService());
      await ImplementingPartnerReferralServicesOfflineProvider()
          .addOrUpdateReferralServices(implementingPartnerReferralService);
    }
  }

  Future<void> addImplementingPartnerReferralServices(
    String username,
    String password,
  ) async {
    try {
      String referralServices =
          await getImplementingPartnerReferralServicesFromTheServer(
              username, password);
      ImplementingPartnerReferralService implementingPartnerReferralService =
          new ImplementingPartnerReferralService(
              id: DefaultImplementingPartnerReferralServices.referralServicesId,
              services: referralServices);
      await ImplementingPartnerReferralServicesOfflineProvider()
          .addOrUpdateReferralServices(implementingPartnerReferralService);
    } catch (e) {
      print('addImplementingPartnerReferralServices: ${e.toString()}');
    }
  }
}
