import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/ovc_asessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_case_plan/ovc_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_monitor/ovc_monitor.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_service/ovc_service_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/components/ovc_service_child_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/constants/ovc_child_service_home_constant.dart';
import 'package:provider/provider.dart';

class OvcChildServiceHome extends StatelessWidget {
  final String label = 'Child';
  final List<OvcChildServiceHomeContant> ovcChildServiceHomeCards =
      OvcChildServiceHomeContant.getOvcChildServiceHomeContant();

  void onOpenChildAssessment(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcAssessmentServiceChildView(),
        ));
  }

  void onOpenChildCasePlan(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcCasePlanChildView(),
        ));
  }

  void onOpenChildMonitor(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcMonitorChildView(),
        ));
  }

  void onOpenChildService(BuildContext context) {
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
          child: Column(
            children: [
              OvcChildInfoTopHeader(),
              Container(
                child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                    bool isLoading = serviveEventDataState.isLoading;
                    var eventListByProgramStage =
                        serviveEventDataState.eventListByProgramStage;
                    return isLoading
                        ? Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: CircularProcessLoader(
                              color: Colors.blueGrey,
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 13.0),
                            child: GridView.count(
                              crossAxisCount: 2,
                              primary: false,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              shrinkWrap: true,
                              children: ovcChildServiceHomeCards.map(
                                  (OvcChildServiceHomeContant
                                      ovcChildServiceHomeCard) {
                                int countValue = 0;
                                for (String programStage
                                    in ovcChildServiceHomeCard.programStages) {
                                  var events =
                                      eventListByProgramStage[programStage] ??
                                          [];
                                  countValue += events.length;
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5.0),
                                  child: InkWell(
                                    child: OvcServiceChildCard(
                                      ovcChildServiceHomeCard:
                                          ovcChildServiceHomeCard,
                                      countValue: countValue.toString(),
                                    ),
                                    onTap: () => ovcChildServiceHomeCard.id ==
                                            'assessment'
                                        ? onOpenChildAssessment(context)
                                        : ovcChildServiceHomeCard.id ==
                                                'casePlan'
                                            ? onOpenChildCasePlan(context)
                                            : ovcChildServiceHomeCard.id ==
                                                    'services'
                                                ? onOpenChildService(context)
                                                : ovcChildServiceHomeCard.id ==
                                                        'monitor'
                                                    ? onOpenChildMonitor(
                                                        context)
                                                    : null,
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                  },
                ),
              ),
              Container(child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                bool isLoading = serviveEventDataState.isLoading;
                return Visibility(
                  visible: !isLoading,
                  child: OvcEnrollmentFormSaveButton(
                    label: "GO TO CHILD'S HOUSE HOLD",
                    labelColor: Colors.white,
                    fontSize: 10,
                    buttonColor: Color(0xFF4B9F46),
                    onPressButton: () => childHouseHold(),
                  ),
                );
              })),
            ],
          ),
        )),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
