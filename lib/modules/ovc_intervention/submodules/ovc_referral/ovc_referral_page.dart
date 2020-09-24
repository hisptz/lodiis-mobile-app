import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/referral_pages/ovc_house_hold_referral.dart';

class OvcReferralPage extends StatelessWidget {
  const OvcReferralPage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    void onReferral() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldRefferal()));
  }
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OvcInterventionCard(
              onReferral: onReferral,
              editReferral: true,
              addExit: false,
              editEnrollment: false,
              editService: false,
            ),
            OvcInterventionCard(
              onReferral: onReferral,
              editReferral: true,
              addExit: false,
              editEnrollment: false,
              editService: false,
            ),
            OvcInterventionCard(
              onReferral: onReferral,
              editReferral: true,
              addExit: false,
              editEnrollment: false,
              editService: false,
            ),
            OvcInterventionCard(
              onReferral: onReferral,
              editReferral: true,
              addExit: false,
              editEnrollment: false,
              editService: false,
            ),
            OvcInterventionCard(
              onReferral: onReferral,
              editReferral: true,
              addExit: false,
              editEnrollment: false,
              editService: false,
            ),
          ],
        ),
      ),
    );
  }
}
