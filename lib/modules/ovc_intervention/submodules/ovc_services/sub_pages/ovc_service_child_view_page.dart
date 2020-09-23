import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_appbar_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/asessment/ovc_asessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/case%20plan/ovc_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_child_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/models/ovc_service_chld_view.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/monitor/ovc_monitor.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/service/ovc_service_child.dart';
import 'package:provider/provider.dart';

class OvcServiceChildView extends StatelessWidget {
  void assessment(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcAssessmentServiceChildView(),
        ));
  }

  void casePlan(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcCasePlanChildView(),
        ));
  }

  void monitor(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcMonitorChildView(),
        ));
  }

  void service(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcServiceSubPageChildView(),
        ));
  }

  void childHouseHold() {
    print("go to house child hold");
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
               label: "child",
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            OvcChildAppBarContainer(),
            GridView.count(
                crossAxisCount: 2,
                primary: false,
                childAspectRatio: 0.9,
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                shrinkWrap: true,
                children: OvcServiceChildModel.serviceChildList
                    .map((ovcServiceChildView) {
                  return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height / 16,
                        child: OvcServiceChildCard(
                            countString:
                                ovcServiceChildView.serviceNumber.toString(),
                            serviceIcon: ovcServiceChildView.iconPath,
                            serviceTitle: ovcServiceChildView.title),
                      ),
                      onTap: () => ovcServiceChildView.title == "Asessment"
                          ? assessment(context)
                          : ovcServiceChildView.title == "Case plan"
                              ? casePlan(context)
                              : ovcServiceChildView.title == "Monitor"
                                  ? monitor(context)
                                  : ovcServiceChildView.title == "Service"
                                      ? service(context)
                                      : Container(child: Text("NO Selection")));
                }).toList()),
            OvcEnrollmentFormSaveButton(
              label: "GO TO CHILD'S HOUSE HOLD",
              labelColor: Colors.white,
              fontSize: 10,
              buttonColor: Color(0xFF4B9F46),
              onPressButton: () => childHouseHold(),
            )
          ]),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
