import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovcIntervention_home-card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_appBar.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_children.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_intervention_home_card_body.dart';


class OvcServicesPage extends StatelessWidget {
  const OvcServicesPage({Key key}) : super(key: key);


  void onAssess() {
    print("on ASSESS");
  }

  void onPlan() {
    print("on Plan");
  }

  void onMonitor() {
    print("on Monitor");
  }


  @override
  Widget build(BuildContext context) {
    bool editService = true;
    return Scaffold(
      backgroundColor: Color(0xffedf4ed),
      appBar:AppBar(
         backgroundColor: Colors.white,
         title: OvcInterventionAppBar(title: "HOUSE HOLD LIST"),
      ),
        body:  SingleChildScrollView(
          
          
                  child:OvcIntervention(
editService: editService,
editEnrollment: false,
addExit: false,
editReferral: false,
showChild: false,
ovcInterventionBodyData:   OvcInterventionBodyData(),
bottomContent:  Visibility(
                visible: editService ? true : false,
                child: Container(
                  
                   decoration: BoxDecoration(
                     color: Color.fromRGBO(75, 159, 70, 0.05),
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            
                            right:BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                            left:  BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1),
                             top: BorderSide(
                            color: Color.fromRGBO(75, 159, 70, 0.05),
                            width: 1)
                            )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 21, right: 21, bottom: 14),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: GestureDetector(
                            child: Text("ASSESS",
                                style: TextStyle(
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            onTap: () => onAssess(),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: GestureDetector(
                              child: Text("PLAN",
                                  style: TextStyle(
                                      color: Color(0xFF4B9F46),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              onTap: () => onPlan()),
                        ),
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            child: Text("MONITOR",
                                style: TextStyle(
                                    color: Color(0xFF4B9F46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            onTap: () => onMonitor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
         
                            
                            
                  )
                  
                   Column(
            children: [
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            OvcInterventionCard(editService: true, addExit: false, editEnrollment: false, editReferral: false,),
            ],
          
      ),
        ),
      );
    
    
    
  }
}
