import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldAssessment extends StatelessWidget {
  final String label = 'House Hold Assessment';

  void onAddNewAssessment(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {}

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
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                var currentOvcHouseHold =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseHoldInfoTopHeader(
                        currentOvcHouseHold: currentOvcHouseHold,
                      ),
                      Container(
                        child: Consumer<OvcHouseHoldCurrentSelectionState>(
                          builder: (context, ovcHouseHoldCurrentSelectionState,
                              child) {
                            OvcHouseHold currentOvcHouseHold =
                                ovcHouseHoldCurrentSelectionState
                                    .currentOvcHouseHold;
                            return Container(
                              child: Consumer<ServiveEventDataState>(
                                builder:
                                    (context, serviveEventDataState, child) {
                                  bool isLoading =
                                      serviveEventDataState.isLoading;
                                  Map<String, List<Events>>
                                      eventListByProgramStage =
                                      serviveEventDataState
                                          .eventListByProgramStage;
                                  return isLoading
                                      ? CircularProcessLoader(
                                          color: Colors.blueGrey,
                                        )
                                      : Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child:
                                                    Text('List of assessment'),
                                              ),
                                              Container(
                                                child: Visibility(
                                                  visible: !isLoading,
                                                  child:
                                                      OvcEnrollmentFormSaveButton(
                                                          label:
                                                              "NEW ASSESSMENT",
                                                          labelColor:
                                                              Colors.white,
                                                          fontSize: 10,
                                                          buttonColor:
                                                              Color(0xFF4B9F46),
                                                          onPressButton: () =>
                                                              onAddNewAssessment(
                                                                context,
                                                                currentOvcHouseHold,
                                                              )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
