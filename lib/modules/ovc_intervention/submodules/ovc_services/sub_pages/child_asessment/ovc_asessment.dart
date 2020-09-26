import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/componets/child_assessment_pop_up_modal.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/hiv_new_assment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/tb_new_assessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/well_being_new_assessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_detail_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/models/ovc_service_detail_card.dart';
import 'package:provider/provider.dart';

class OvcAssessmentServiceChildView extends StatelessWidget {
  final String label = 'Child Assessment';

  childAssessment(BuildContext context) async {
    Widget model = ChildAssessmentPopUpModal();
    String response = await AppUtil.showPopUpModal(context, model);
    if (response != null) {
      response == "Wellbeing"
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OvcServiceWellBeingAssessment()))
          : response == "TB"
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OvcServiceTBAssessment()))
              : response == "HIV"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OvcServiceHIVAssessment()))
                  : print(response);
    }
  }

  void onExpand() {
    print("on Expand in Assessment");
  }

  void onEdit() {
    print("on Expand in Edit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(body: Container(child: Text('Home'))),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
    // return Scaffold(
    //     backgroundColor: Color(0xFFEDF4ED),
    //     appBar: PreferredSize(
    //       preferredSize: Size.fromHeight(65.0),
    //       child: Consumer<IntervetionCardState>(
    //         builder: (context, intervetionCardState, child) {
    //           InterventionCard activeInterventionProgram =
    //               intervetionCardState.currentIntervetionProgram;
    //           return SubPageAppBar(
    //             label: "Child Assessment",
    //             activeInterventionProgram: activeInterventionProgram,
    //           );
    //         },
    //       ),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(children: [
    //         OvcChildAppBarContainer(),
    //         Column(
    //           children: OvcChildServiceDetailCard.ovcChildServiceDetailCardSeed
    //               .map((OvcChildServiceDetailCard ovcChildServiceDetailCard) {
    //             return Container(
    //               margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
    //               child: OvcServiceDetailCard(
    //                 assessmentDate: assessmentDate(
    //                     ovcChildServiceDetailCard.assessmentDate),
    //                 healthStatus:
    //                     healthStatus(ovcChildServiceDetailCard.healthStates),
    //                 showBorderColor: false,
    //                 onExpand: onExpand,
    //                 onEdit: onEdit,
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //         OvcEnrollmentFormSaveButton(
    //           label: "NEW ASSESSMENT",
    //           labelColor: Colors.white,
    //           fontSize: 14,
    //           buttonColor: Color(0xFF4B9F46),
    //           onPressButton: () => childAssessment(context),
    //         )
    //       ]),
    //     ),
    //     bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }

  Widget assessmentDate(String date) {
    return Visibility(
        visible: true,
        child: Expanded(
            flex: 4,
            child: Container(
                child: Text(
              "$date",
              style: TextStyle(color: Color(0xFF8FAF8F)),
            ))));
  }

  Widget healthStatus(String _healthStatus) {
    return Visibility(
        child: Expanded(
            flex: 5,
            child: Container(
                padding: EdgeInsets.only(left: 19),
                child: Text(
                  "$_healthStatus",
                  style: TextStyle(fontSize: 14, color: Color(0xFF1A3518)),
                ))));
  }
}
