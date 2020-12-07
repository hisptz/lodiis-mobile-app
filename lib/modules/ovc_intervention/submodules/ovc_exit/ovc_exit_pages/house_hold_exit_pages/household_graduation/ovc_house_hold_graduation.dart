import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_graduation/components/ovc_house_hold_graduation_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_graduation/constants/ovc_house_hold_achievement_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/house_hold_exit_pages/household_graduation/pages/ovc_house_hold_graduation_form.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldGraduation extends StatelessWidget {
  final String label = 'Household Case Plan Graduation Readiness';
  final List<String> programStageIds = [
    OvcHouseHoldGraduationConstant.programStage
  ];

  void updateFormState(
      BuildContext context, bool isEditableMode, Events graduation) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);

    if (graduation != null) {
      Provider.of<ServiceFormState>(context, listen: false);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', graduation.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', graduation.event);
      for (Map datavalue in graduation.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcHouseHoldGraduationForm(),
      ),
    );
  }

  void onAddNewHouseHoldAchievement(
    BuildContext context,
    OvcHouseHold houseHold,
  ) {
    updateFormState(context, true, null);
  }

  void onViewHouseHoldAchievement(
      BuildContext context, OvcHouseHold houseHold, Events graduation) {
    updateFormState(context, false, graduation);
  }

  void onEditHouseHoldAchievement(
      BuildContext context, OvcHouseHold houseHold, Events graduation) {
    updateFormState(context, true, graduation);
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
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String currentLanguage = languageTranslationState.currentLanguage;
              return Consumer<OvcHouseHoldCurrentSelectionState>(
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
                            builder: (context,
                                ovcHouseHoldCurrentSelectionState, child) {
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
                                        ? Container(
                                            child: CircularProcessLoader(
                                              color: Colors.blueGrey,
                                            ),
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
                                                      OvcHouseHoldGraduationListContainer(
                                                    programStageIds:
                                                        programStageIds,
                                                    onEditHouseHoldAchievement:
                                                        (Events graduation) =>
                                                            onEditHouseHoldAchievement(
                                                      context,
                                                      currentOvcHouseHold,
                                                      graduation,
                                                    ),
                                                    onViewHouseHoldAchievement:
                                                        (Events graduation) =>
                                                            onViewHouseHoldAchievement(
                                                      context,
                                                      currentOvcHouseHold,
                                                      graduation,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Visibility(
                                                    visible: !isLoading,
                                                    child: EntryFormSaveButton(
                                                      label: currentLanguage ==
                                                              'lesotho'
                                                          ? 'Graduation e ncha'
                                                              .toUpperCase()
                                                          : "NEW GRADUATION",
                                                      labelColor: Colors.white,
                                                      fontSize: 10,
                                                      buttonColor:
                                                          Color(0xFF4B9F46),
                                                      onPressButton: () =>
                                                          onAddNewHouseHoldAchievement(
                                                        context,
                                                        currentOvcHouseHold,
                                                      ),
                                                    ),
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
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
