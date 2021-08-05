import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/components/ovc_household_assessment_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/constants/ovc_household_assessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/pages/ovc_household_assessment_form.dart';
import 'package:provider/provider.dart';

class OvcHouseholdAssessment extends StatelessWidget {
  final String label = 'Household Assessment';
  final List<String> programStageIds = [
    OvcHouseholdAssessmentConstant.programStage
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
        MaterialPageRoute(builder: (context) => OvcHouseholdAssessmentForm()));
  }

  void onAddNewHouseholdAssessment(
    BuildContext context,
    OvcHousehold houseHold,
  ) {
    updateFormState(context, true, null);
  }

  void onViewHouseholdAssessment(
      BuildContext context, OvcHousehold houseHold, Events assessment) {
    updateFormState(context, false, assessment);
  }

  void onEditHouseholdAssessment(
      BuildContext context, OvcHousehold houseHold, Events assessment) {
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
            child: Consumer<OvcHouseholdCurrentSelectionState>(
              builder: (context, ovcHouseholdCurrentSelectionState, child) {
                var currentOvcHousehold =
                    ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseholdInfoTopHeader(
                        currentOvcHousehold: currentOvcHousehold,
                      ),
                      Container(
                        child: Consumer<OvcHouseholdCurrentSelectionState>(
                          builder: (context, ovcHouseholdCurrentSelectionState,
                              child) {
                            OvcHousehold currentOvcHousehold =
                                ovcHouseholdCurrentSelectionState
                                    .currentOvcHousehold;
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
                                                    OvcHouseholdAssessmentListContainer(
                                                        programStageIds:
                                                            programStageIds,
                                                        onEditHouseholdAssessment:
                                                            (Events assessment) =>
                                                                onEditHouseholdAssessment(
                                                                  context,
                                                                  currentOvcHousehold,
                                                                  assessment,
                                                                ),
                                                        onViewHouseholdAssessment:
                                                            (Events assessment) =>
                                                                onViewHouseholdAssessment(
                                                                  context,
                                                                  currentOvcHousehold,
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
                                                          onAddNewHouseholdAssessment(
                                                            context,
                                                            currentOvcHousehold,
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
