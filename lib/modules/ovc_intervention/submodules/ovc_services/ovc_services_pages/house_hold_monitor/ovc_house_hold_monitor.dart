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
import 'package:provider/provider.dart';
import 'components/ovc_house_hold_monitor_list_container.dart';
import 'constants/ovc_house_hold_monitor_constant.dart';
import 'pages/ovc_house_hold_monitor_form.dart';

class OvcHouseHoldMonitor extends StatelessWidget {
  final String label = 'House Hold Monitor';
  final List<String> programStageIds = [
    OvcHouseHoldMonitorConstant.programStage
  ];

  void updateFormState(
      BuildContext context, bool isEditableMode, Events achievement) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);

    if (achievement != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', achievement.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', achievement.event);
      for (Map datavalue in achievement.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldMonitorForm()));
  }

 void onAddNewHouseHoldMonitor(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {
   updateFormState(context, true, null);
  }
  void onViewHouseHoldMonitor(
      BuildContext context, OvcHouseHold houseHold, Events monitor) {
    updateFormState(context, false, monitor);
  }
  void onEditHouseHoldMonitor(
      BuildContext context, OvcHouseHold houseHold, Events monitor) {
    updateFormState(context, true, monitor);
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
                                                    OvcHouseHoldMonitorListContainer(
                                                        programStageIds:
                                                            programStageIds,
                                                        onEditHouseHoldMonitor:
                                                            (Events monitor) =>
                                                                onEditHouseHoldMonitor(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  monitor,
                                                                ),
                                                        onViewHouseHoldMonitor:
                                                            (Events monitor) =>
                                                                onViewHouseHoldMonitor(
                                                                  context,
                                                                  currentOvcHouseHold,
                                                                  monitor,
                                                                )
                                                       ),
                                              ),
                                              Container(
                                                child: Visibility(
                                                  child:
                                                      OvcEnrollmentFormSaveButton(
                                                          label:
                                                              "ADD VISIT",
                                                          labelColor:
                                                              Colors.white,
                                                          fontSize: 10,
                                                          buttonColor:
                                                              Color(0xFF4B9F46),
                                                          onPressButton: () =>
                                                              onAddNewHouseHoldMonitor(
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
