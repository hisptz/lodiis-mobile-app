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

class OvcAssessmentServiceChildView extends StatelessWidget {
  childAssessment() {
    print("assess child");
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
        backgroundColor: Color(0xFFEDF4ED),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: "Child Assessment",
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
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  child: OvcServiceDetailCard(
                    assessmentDate: assessmentDate(
                        ovcChildServiceDetailCard.assessmentDate),
                    healthStatus:
                        healthStatus(ovcChildServiceDetailCard.healthStates),
                    showBorderColor: false,
                    onExpand: onExpand,
                    onEdit: onEdit,
                  ),
                );
              }).toList(),
            ),
            OvcEnrollmentFormSaveButton(
              label: "NEW ASSESSMENT",
              labelColor: Colors.white,
              fontSize: 14,
              buttonColor: Color(0xFF4B9F46),
              onPressButton: () => childAssessment(),
            )
          ]),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
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
