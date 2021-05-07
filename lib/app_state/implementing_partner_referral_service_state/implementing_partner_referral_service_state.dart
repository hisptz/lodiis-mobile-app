import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/implementing_partner_referral_services_offline/implementing_partner_referral_services_offline_provider.dart';

class ImplementingPartnerReferralServiceState with ChangeNotifier {
  Map<String, dynamic> _implementingPartnerReferralServices = {};

  Map<String, dynamic> get implementingPartnerServices =>
      _implementingPartnerReferralServices;

  Future<void> setImplementingPartnerServices() async {
    // get From database
    // String referralServicesId = "referral-services";
    // String referralJsonData =
    //     await ImplementingPartnerReferralServicesOfflineProvider()
    //         .getImplementingUserServices(referralServicesId);

    String referralJsonData =
        '{"EGPAF":["HIV Testing and counselling","ART and Adherence","PMTCT Services","FamilyPlanningSRH","HTS","ANC","PrEP/PEP","PMTCT","Treatment Support (TB/ARV)","PLHIV support group","Referral to post abuse care services","Evaluation for ARVs/HAART","GBV Monitoring","Post abuse case management","HIV Prevention Messaging","Aflateen/toun","Go Girls","LBSE","PTS 4 NON-GRAD","PTS 4-GRAD","SILC","FINANCIAL EDUCATION","SAVING GROUPS","STEPPING STONES","IPC","GBV Legal Protection","GBV Legal Messaging","Parenting","VAC Legal","VAC Legal Messaging"],"PSI":["FamilyPlanningSRH","Condom supply","HTS"],"KB-AGYW/DREAMS":["PrEP/PEP","Income generating activity","Referral to post abuse care services","Post abuse case management"],"JHPIEGO":["STI Screening","STI Treatment","Evaluation for ARVs/HAART","PMTCT Services","Cervical Cancer Screening","FamilyPlanningSRH","Condom supply","TB screening","TB treatment","HTS","ANC","PrEP/PEP","Treatment Support (TB/ARV)","Youth friendly services","Gender Based Violence","Domestic Violence Support group","Income generating activity","Orphan Care & Support","Psycho-social Support","PLHIV support group","Referral to post abuse care services","Educational and vocational support","Social grants","Post abuse case management"]}';
    Map<String, dynamic> referralServices = jsonDecode(referralJsonData);
    _implementingPartnerReferralServices.addAll(referralServices);
  }
}
