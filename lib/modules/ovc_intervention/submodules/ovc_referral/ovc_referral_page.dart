import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';

class OvcReferralPage extends StatelessWidget {
  const OvcReferralPage({Key key}) : super(key: key);

  Widget referral() {
    return GestureDetector(
      onTap: () {

      },
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.25,
          ),
          SizedBox(
            width: 13.65,
          ),
          Text("REFERRAL",
              style: TextStyle(
                color: Color(0xFF4B9F46)
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
           appBar: AppBar(
         backgroundColor: Colors.white,
         title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
      body:  SingleChildScrollView(
              child: Column(
            children: [
             OvcInterventionCard(editReferral: true, addExit: false, editEnrollment: false, editService: false,),
              OvcInterventionCard(editReferral: true, addExit: false, editEnrollment: false, editService: false,),
               OvcInterventionCard(editReferral: true, addExit: false, editEnrollment: false, editService: false,),
                OvcInterventionCard(editReferral: true, addExit: false, editEnrollment: false, editService: false,),
                 OvcInterventionCard(editReferral: true, addExit: false, editEnrollment: false, editService: false,),
            ],
          
        ),
      ),
    );
  }
}
