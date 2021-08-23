import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
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
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_household_service_adult_wellbeing.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/constants/ovc_household_assessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/skip_logics/ovc_household_assessment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcHouseholdAssessmentForm extends StatefulWidget {
  const OvcHouseholdAssessmentForm({Key? key}) : super(key: key);

  @override
  _OvcHouseholdAssessmentFormState createState() =>
      _OvcHouseholdAssessmentFormState();
}

class _OvcHouseholdAssessmentFormState
    extends State<OvcHouseholdAssessmentForm> {
  final String label = 'Household Assessment Form';
  List<FormSection>? formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcHouseholdServiceAdultWellbeing.getFormSections();
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
          formSections!,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    if (id == 'ZuaV20IvVV2') {
      Provider.of<ServiceFormState>(context, listen: false)
          .removeFieldFromState('kCuxe1Psh8E');
    }
    evaluateSkipLogics();
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

      List<String> skippedFields = [];
      //Add Manually set keys

      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcHouseholdAssessmentConstant.program,
            OvcHouseholdAssessmentConstant.programStage,
            currentOvcHousehold!.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            currentOvcHousehold.id,
            eventId,
            null,
            skippedFields: skippedFields);
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
            child: Consumer<LanguageTranslationState>(
              builder: (context, languageTranslationState, child) {
                String? currentLanguage =
                    languageTranslationState.currentLanguage;
                return Consumer<OvcHouseholdCurrentSelectionState>(
                  builder: (context, ovcHouseholdCurrentSelectionState, child) {
                    var currentOvcHousehold =
                        ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        return Container(
                          child: Column(
                            children: [
                              OvcHouseholdInfoTopHeader(
                                currentOvcHousehold: currentOvcHousehold,
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
                                              hiddenInputFieldOptions:
                                                  serviceFormState
                                                      .hiddenInputFieldOptions,
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
                                                currentOvcHousehold,
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
