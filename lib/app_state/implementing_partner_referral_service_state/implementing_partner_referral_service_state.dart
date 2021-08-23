import 'dart:async';

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:kb_mobile_app/core/constants/default_implementing_partner_referral_service.dart';
import 'package:kb_mobile_app/core/offline_db/implementing_partner_referral_services_offline/implementing_partner_referral_services_offline_provider.dart';

class ImplementingPartnerReferralServiceState with ChangeNotifier {
  Map<String, dynamic> _implementingPartnerReferralServices = {};

  Map<String, dynamic> get implementingPartnerServices =>
      _implementingPartnerReferralServices;

  Future<void> setImplementingPartnerServices() async {
    String? referralJsonData =
        await (ImplementingPartnerReferralServicesOfflineProvider()
            .getImplementingPartnerReferralServices(
                DefaultImplementingPartnerReferralServices.referralServicesId));
    Map<String, dynamic> referralServices = jsonDecode(referralJsonData!);
    _implementingPartnerReferralServices.addAll(referralServices);
  }
}
