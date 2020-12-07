import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_monitor/pages/add_service/constants/ovc_service_monitoring_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_monitor/pages/add_service/skip_logics/ovc_child_service_monitoring_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcServiceMonitoringForm extends StatefulWidget {
  @override
  _OvcServiceMonitoringFormState createState() =>
      _OvcServiceMonitoringFormState();
}

class _OvcServiceMonitoringFormState extends State<OvcServiceMonitoringForm> {
  final String label = 'Ongoing monitoring tool';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcServicesOngoingMonitoring.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await OvcChildServiceMonitoringSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) async {
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcServiceMonitoringConstant.program,
            OvcServiceMonitoringConstant.programStage,
            currentOvcHouseHoldChild.orgUnit,
            formSections,
            dataObject,
            eventDate,
            currentOvcHouseHoldChild.id,
            eventId,
            null);
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHouseHoldChild.id);
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          String currentLanguage =
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
                message: e.toString(), position: ToastGravity.BOTTOM);
            Navigator.pop(context);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
          position: ToastGravity.TOP);
    }
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
                String currentLanguage =
                    languageTranslationState.currentLanguage;
                return Consumer<OvcHouseHoldCurrentSelectionState>(
                  builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                    OvcHouseHoldChild currentOvcHouseHoldChild =
                        ovcHouseHoldCurrentSelectionState
                            .currentOvcHouseHoldChild;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        return Container(
                          child: Column(
                            children: [
                              OvcChildInfoTopHeader(),
                              Container(
                                child: !isFormReady
                                    ? Container(
                                        child: CircularProcessLoader(
                                          color: Colors.blueGrey,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10.0,
                                              left: 13.0,
                                              right: 13.0,
                                            ),
                                            child: EntryFormContainer(
                                              hiddenSections: serviceFormState
                                                  .hiddenSections,
                                              hiddenFields:
                                                  serviceFormState.hiddenFields,
                                              formSections: formSections,
                                              mandatoryFieldObject: Map(),
                                              dataObject:
                                                  serviceFormState.formState,
                                              isEditableMode: serviceFormState
                                                  .isEditableMode,
                                              onInputValueChange:
                                                  onInputValueChange,
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                serviceFormState.isEditableMode,
                                            child: EntryFormSaveButton(
                                              label: isSaving
                                                  ? 'Saving ...'
                                                  : currentLanguage == 'lesotho'
                                                      ? 'Boloka'
                                                      : 'Save',
                                              labelColor: Colors.white,
                                              buttonColor: Color(0xFF4B9F46),
                                              fontSize: 15.0,
                                              onPressButton: () => onSaveForm(
                                                  context,
                                                  serviceFormState.formState,
                                                  currentOvcHouseHoldChild),
                                            ),
                                          )
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
