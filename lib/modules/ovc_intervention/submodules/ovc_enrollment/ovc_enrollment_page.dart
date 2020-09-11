import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';

class OvcEnrollmentPage extends StatelessWidget {
  const OvcEnrollmentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(229,229,229,1),
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width:23,
            ),
            Text("HOUSE HOLD LIST",style: TextStyle(color: Colors.black45,fontSize:14,fontWeight: FontWeight.bold ),),
          ],
        )
        ),
        body: SingleChildScrollView(
          
                  child: Column(
            children: [
              OvcInterventionCardState(editEnrollment: true, addExit: false, editReferral: false, editService: false,),
              OvcInterventionCardState(editEnrollment: true, addExit: false, editReferral: false, editService: false,),
              OvcInterventionCardState(editEnrollment: true, addExit: false, editReferral: false, editService: false,),
              OvcInterventionCardState(editEnrollment: true, addExit: false, editReferral: false, editService: false,),
              OvcInterventionCardState(editEnrollment: true, addExit: false, editReferral: false, editService: false,)
            ],
          
      ),
        ),
      );
    
    
  }
}
