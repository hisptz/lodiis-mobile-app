import 'package:kb_mobile_app/core/constants/default_implementing_partner_referral_service.dart';

class ImplementingPartnerReferralService {
  String? id;
  String? services;

  ImplementingPartnerReferralService({this.id, this.services});

  @override
  String toString() {
    return 'logs <$services>';
  }

  Map toOffline(ImplementingPartnerReferralService referralService) {
    Map offlineData = Map<String, dynamic>();
    offlineData['id'] =
        DefaultImplementingPartnerReferralServices.referralServicesId;
    offlineData['services'] = referralService.services;

    return offlineData;
  }

  ImplementingPartnerReferralService.fromOffline(
      Map<String, dynamic> offlineData) {
    this.id = offlineData['id'];
    this.services = offlineData['services'];
  }
}
