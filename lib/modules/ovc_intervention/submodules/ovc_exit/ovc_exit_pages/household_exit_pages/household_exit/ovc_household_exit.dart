import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/models/ovc_exit_information.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/component/ovc_household_exit_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_exit/constants/ovc_household_exit_constant.dart';
import 'package:provider/provider.dart';

class OvcHouseholdExit extends StatefulWidget {
  @override
  _OvcHouseholdExitState createState() => _OvcHouseholdExitState();
}

class _OvcHouseholdExitState extends State<OvcHouseholdExit> {
  final String label = 'Household Exit Form';
  final List<String> programStageIds = [OvcHouseholdExitConstant.programStage];

  bool isSaving = false;
  List<FormSection>? formSections;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcExitInformation.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
      });
    });
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHousehold? currentOvcHousehold,
  ) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          OvcHouseholdExitConstant.program,
          OvcHouseholdExitConstant.programStage,
          currentOvcHousehold!.orgUnit,
          formSections!,
          dataObject,
          eventDate,
          currentOvcHousehold.id,
          eventId,
          null,
        );
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHousehold.id);
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
              message: e.toString(),
              position: ToastGravity.BOTTOM,
            );
            Navigator.pop(context);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill at least one form field',
        position: ToastGravity.TOP,
      );
    }
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
              OvcHousehold? currentOvcHousehold =
                  ovcHouseholdCurrentSelectionState.currentOvcHousehold;
              return Container(
                child: Column(
                  children: [
                    OvcHouseholdInfoTopHeader(
                      currentOvcHousehold: currentOvcHousehold,
                    ),
                    Container(
                      child: Consumer<ServiceEventDataState>(
                        builder: (context, serviceEventDataState, child) {
                          bool isLoading = serviceEventDataState.isLoading;
                          Map<String?, List<Events>> eventListByProgramStage =
                              serviceEventDataState.eventListByProgramStage;
                          List<Events> eventList = TrackedEntityInstanceUtil
                              .getAllEventListFromServiceDataStateByProgramStages(
                                  eventListByProgramStage, programStageIds);
                          Events? event =
                              eventList.length > 0 ? eventList[0] : null;
                          return isLoading && !isFormReady
                              ? CircularProcessLoader(
                                  color: Colors.blueGrey,
                                )
                              : Container(
                                  child: OvcHouseholdExitFormContainer(
                                    event: event,
                                    isSaving: isSaving,
                                    exitType: 'exit',
                                    formSections: formSections,
                                    onSaveForm: (dataObject) => this.onSaveForm(
                                      context,
                                      dataObject,
                                      currentOvcHousehold,
                                    ),
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
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
