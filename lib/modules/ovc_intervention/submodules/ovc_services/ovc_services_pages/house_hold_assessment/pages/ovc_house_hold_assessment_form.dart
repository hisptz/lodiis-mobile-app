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
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_household_service_adult_wellbeing.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/constants/ovc_house_hold_assessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_assessment/skip_logics/ovc_house_hold_assessment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldAssessmentForm extends StatefulWidget {
  const OvcHouseHoldAssessmentForm({Key key}) : super(key: key);

  @override
  _OvcHouseHoldAssessmentFormState createState() =>
      _OvcHouseHoldAssessmentFormState();
}

class _OvcHouseHoldAssessmentFormState
    extends State<OvcHouseHoldAssessmentForm> {
  final String label = 'Household Assessment Form';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcHouseHoldServiceAdultWellbeing.getFormSections();
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
        await OvchouseHoldAssessmentSkipLogic.evaluateSkipLogics(
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
    OvcHouseHold currentOvcHouseHold,
  ) async {
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcHouseHoldAssessmentConstant.program,
            OvcHouseHoldAssessmentConstant.programStage,
            currentOvcHouseHold.orgUnit,
            formSections,
            dataObject,
            eventDate,
            currentOvcHouseHold.id,
            eventId,
            null);
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHouseHold.id);
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
                    var currentOvcHouseHold =
                        ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        return Container(
                          child: Column(
                            children: [
                              OvcHouseHoldInfoTopHeader(
                                currentOvcHouseHold: currentOvcHouseHold,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 13.0),
                                child: !isFormReady
                                    ? Container(
                                        child: CircularProcessLoader(
                                          color: Colors.blueGrey,
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Container(
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
                                            child: OvcEnrollmentFormSaveButton(
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
                                                currentOvcHouseHold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                              )
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
