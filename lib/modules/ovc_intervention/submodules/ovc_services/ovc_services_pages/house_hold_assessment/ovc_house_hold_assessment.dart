import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/components/ovc_house_hold_assessment_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/constants/ovc_house_hold_assessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/pages/ovc_house_hold_assessment_form.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldAssessment extends StatelessWidget {
  final String label = 'Household Assessment';
  final List<String> programStageIds = [
    OvcHouseHoldAssessmentConstant.programStage
  ];

  void updateFormState(
      BuildContext context, bool isEditableMode, Events assessment) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);

    if (assessment != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', assessment.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', assessment.event);
      for (Map dataValue in assessment.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldAssessmentForm()));
  }

  void onAddNewHouseHoldAssessment(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {
    updateFormState(context, true, null);
  }

  void onViewHouseHoldAssessment(
      BuildContext context, OvcHouseHold houseHold, Events assessment) {
    updateFormState(context, false, assessment);
  }

  void onEditHouseHoldAssessment(
      BuildContext context, OvcHouseHold houseHold, Events assessment) {
    updateFormState(context, true, assessment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
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
                              child: Consumer<ServiceEventDataState>(
                                builder:
                                    (context, serviceEventDataState, child) {
                                  bool isLoading =
                                      serviceEventDataState.isLoading;
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
                                                margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  right: 13.0,
                                                  left: 13.0,
                                                ),
                                                child:
                                                    OvcHouseHoldAssessmentListContainer(
                                                        programStageIds:
                                                            programStageIds,
                                                        onEditHouseHoldAssessment:
                                                            (Events assessment) =>
                                                                onEditHouseHoldAssessment(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  assessment,
                                                                ),
                                                        onViewHouseHoldAssessment:
                                                            (Events assessment) =>
                                                                onViewHouseHoldAssessment(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  assessment,
                                                                )),
                                              ),
                                              Container(
                                                child: Visibility(
                                                  visible: !isLoading,
                                                  child: EntryFormSaveButton(
                                                      label: "NEW ASSESSMENT",
                                                      labelColor: Colors.white,
                                                      fontSize: 10,
                                                      buttonColor:
                                                          Color(0xFF4B9F46),
                                                      onPressButton: () =>
                                                          onAddNewHouseHoldAssessment(
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
