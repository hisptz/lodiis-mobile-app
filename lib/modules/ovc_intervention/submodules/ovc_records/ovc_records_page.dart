import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';

class OvcRecordsPage extends StatelessWidget {
  const OvcRecordsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229,229,229,1),
      appBar:AppBar(
         backgroundColor: Colors.white,
         title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
        body: SingleChildScrollView(
              child: Column(
            children: [
              OvcInterventionCard(addExit: true, editEnrollment: false, editReferral: false, editService: false,),
               OvcInterventionCard(addExit: true, editEnrollment: false, editReferral: false, editService: false,),
                OvcInterventionCard(addExit: true, editEnrollment: false, editReferral: false, editService: false,),
                 OvcInterventionCard(addExit: true, editEnrollment: false, editReferral: false, editService: false,),
                  OvcInterventionCard(addExit: true, editEnrollment: false, editReferral: false, editService: false,),
            ],
          
        ),
      ),
      );
    
    
  }
}
