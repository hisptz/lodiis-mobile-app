import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_detail_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/models/ovc_service_detail_card.dart';
import 'package:provider/provider.dart';

class OvcCasePlanChildView extends StatelessWidget {
  void assessment(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcCasePlanChildView(),));}
          
  void onExpand(){ }
  void onEdit(){}
   caseplan() {}

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
                  label: "Caseplan",
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
                  child: Column(children: [
            OvcChildAppBarContainer(),         
        Column(
       
              children: OvcChildServiceDetailCard.ovcChildServiceDetailCardSeed
                  .map((OvcChildServiceDetailCard ovcChildServiceDetailCard) {             

                return  ovcChildServiceDetailCard.casePlan != null ?
                    Container(
                      
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                      child: OvcServiceDetailCard(
                          assessmentDate:casePlanDate( ovcChildServiceDetailCard.casePlanDate),
                          healthStatus:casePlan( ovcChildServiceDetailCard.casePlan),
                          showBorderColor: true,
                          onExpand: onExpand,
                           onEdit: onEdit,
                        ),
                    ):Text("");
              }).toList(),),
            OvcEnrollmentFormSaveButton(
              label: "NEW PLAN",
              labelColor: Colors.white,
              fontSize: 14,
              buttonColor: Color(0xFF4B9F46),
              onPressButton: () => caseplan(),
            )
          ]),
        ),
                      
                      bottomNavigationBar: InterventionBottomNavigationBarContainer());
                }


  Widget casePlanDate(String date) {
    return Visibility(
           child: Expanded(
            flex: 6,
            child: Container(
                child: Text(
              "$date",
              style: TextStyle(color: Color(0xFF8FAF8F)),
            ))));
  }

  Widget casePlan(String casePlan) {
    return Visibility(
        child: Expanded(
            flex: 7,
            child: Container(
                          padding: EdgeInsets.only(left: 15),
                                                child: Text(
                            "$casePlan",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF143D14)),
                          ))));
  }
              
               
}
