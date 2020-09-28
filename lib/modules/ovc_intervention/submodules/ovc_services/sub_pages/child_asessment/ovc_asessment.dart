import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/componets/ovc_child_assessment_selection.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_hiv_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_tb__assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_well_being_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_detail_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/models/ovc_service_detail_card.dart';
import 'package:provider/provider.dart';

class OvcAssessmentServiceChildView extends StatelessWidget {
  final String label = 'Child Assessment';

  onAddMewchildAssessment(BuildContext context) async {
    //reset form field data
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Widget model = OvcChildAssessmentSelection();
    String assessmentResponse = await AppUtil.showPopUpModal(context, model);
    if (assessmentResponse != null) {
      assessmentResponse == "Well-being"
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OvcServiceWellBeingAssessmentForm()))
          : assessmentResponse == "TB"
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OvcServiceTBAssessmentForm()))
              : assessmentResponse == "HIV"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OvcServiceHIVAssessmentForm()))
                  : print(assessmentResponse);
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
        body: SubPageBody(
          body: Container(
            child: Column(children: [
              OvcChildInfoTopHeader(),
              Container(
                child: Text('List of assessments'),
              ),
              Container(
                  child: OvcEnrollmentFormSaveButton(
                label: "NEW ASSESSMENT",
                labelColor: Colors.white,
                fontSize: 14,
                buttonColor: Color(0xFF4B9F46),
                onPressButton: () => onAddMewchildAssessment(context),
              ))
            ]),
          ),
        ),
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
    // OvcEnrollmentFormSaveButton(
    //   label: "NEW ASSESSMENT",
    //   labelColor: Colors.white,
    //   fontSize: 14,
    //   buttonColor: Color(0xFF4B9F46),
    //   onPressButton: () => childAssessment(context),
    // )
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
