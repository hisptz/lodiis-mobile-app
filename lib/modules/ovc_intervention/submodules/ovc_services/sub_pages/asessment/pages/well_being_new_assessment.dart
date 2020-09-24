import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:provider/provider.dart';



class OvcServiceWellBeingAssessment extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDF4ED),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: "New Well-being Assessemnt",
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: Column(children: [
            OvcChildAppBarContainer(),
           Container(
             height: MediaQuery.of(context).size.height/3,
             child: Center(
               child: Text("Well-being Assessemnt forms"),
             ),
           ),
          
                        ]),
                      
                      bottomNavigationBar: InterventionBottomNavigationBarContainer());
                }
              
               
}

