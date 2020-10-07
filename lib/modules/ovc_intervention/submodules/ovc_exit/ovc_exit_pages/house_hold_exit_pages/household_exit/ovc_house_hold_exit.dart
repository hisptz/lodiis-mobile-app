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
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_exit/components/ovc_house_hold_exit_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_exit/constants/ovc_house_hold_exit_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_exit/pages/ovc_house_hold_exit_form.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldExit extends StatelessWidget {
  final String label = 'Exit Form';
  final List<String> programStageIds = [
    OvcHouseHoldExitConstant.programStage
  ];

  void updateFormState(
      BuildContext context, bool isEditableMode, Events exit) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);

    if (exit != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', exit.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', exit.event);
      for (Map datavalue in exit.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldExitForm()));
  }

  void onAddNewHouseHoldExit(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {
    updateFormState(context, true, null);
  }

  void onViewHouseHoldExit(
      BuildContext context, OvcHouseHold houseHold, Events exit) {
    updateFormState(context, false, exit);
  }

  void onEditHouseHoldExit(
      BuildContext context, OvcHouseHold houseHold, Events exit) {
    updateFormState(context, true, exit);
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
                                                    OvcHouseHoldExitListContainer(
                                                        programStageIds:
                                                            programStageIds,
                                                        onEditHouseHoldExit:
                                                            (Events exit) =>
                                                                onEditHouseHoldExit(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  exit,
                                                                ),
                                                        onViewHouseHoldExit:
                                                            (Events exit) =>
                                                                onViewHouseHoldExit(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  exit,
                                                                )),
                                              ),
                                              Container(
                                                child: Visibility(
                                                  visible: !isLoading,
                                                  child:
                                                      OvcEnrollmentFormSaveButton(
                                                          label:
                                                              "NEW EXIT",
                                                          labelColor:
                                                              Colors.white,
                                                          fontSize: 10,
                                                          buttonColor:
                                                              Color(0xFF4B9F46),
                                                          onPressButton: () =>
                                                              onAddNewHouseHoldExit(
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
