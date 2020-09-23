import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';

class OvcAssessmentServiceChildView extends StatelessWidget {
  void assessment(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcAssessmentServiceChildView(),
        ));
  }

  childAssessment() {
    print("assess child");
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
                isLeading: true,
                label: "Child Assessment",
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: Column(children: [
          OvcChildAppBarContainer(),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Text("assessment"),
            ),
          ),
          OvcEnrollmentFormSaveButton(
            label: "NEW ASSESSMENT",
            labelColor: Colors.white,
            fontSize: 10,
            buttonColor: Color(0xFF4B9F46),
            onPressButton: () => childAssessment(),
          )
        ]),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
