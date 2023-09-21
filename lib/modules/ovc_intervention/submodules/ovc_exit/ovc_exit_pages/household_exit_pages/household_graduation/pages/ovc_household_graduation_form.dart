import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/models/household_graduation_rediness_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_graduation/constants/ovc_household_graduation_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/skip_logics/ovc_household_case_plan_achievement_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcHouseholdGraduationForm extends StatefulWidget {
  const OvcHouseholdGraduationForm({Key? key}) : super(key: key);

  @override
  State<OvcHouseholdGraduationForm> createState() =>
      _OvcHouseholdGraduationFormState();
}

class _OvcHouseholdGraduationFormState
    extends State<OvcHouseholdGraduationForm> {
  final String label = 'Household Case Plan Graduation Readiness';
  List<FormSection>? formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setFromSection();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  setFromSection() {
    OvcHousehold? household =
        Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
            .currentOvcHousehold;
    formSections = HouseholdGraduationReadinessForm.getFormSections(
      firstDate: household!.createdDate!,
    );
    addCaregiverAttributesNeededForGraduation(household);
  }

  void addCaregiverAttributesNeededForGraduation(OvcHousehold ovcHousehold) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('hivStatus', ovcHousehold.hivStatus);
  }

  evaluateSkipLogics() {
    Timer(
      const Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await OvcHouseholdCasePlanAchievementSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
      },
    );
  }

  void clearFormAutoSaveState(
      BuildContext context, String? beneficiaryId, String eventId) async {
    String formAutoSaveId =
        "${OvcRoutesConstant.householdGraduationFormPage}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    var ovc =
        Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
            .currentOvcHousehold!;
    String? beneficiaryId = ovc.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String eventId = dataObject['eventId'] ?? '';
    String id =
        "${OvcRoutesConstant.householdGraduationFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: OvcRoutesConstant.householdGraduationFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.householdGraduationFormNextPage
          : OvcRoutesConstant.householdGraduationFormPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
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
            OvcHouseholdGraduationConstant.program,
            OvcHouseholdGraduationConstant.programStage,
            currentOvcHousehold!.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            currentOvcHousehold.id,
            eventId,
            null);
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHousehold.id);
        Timer(const Duration(seconds: 1), () {
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
          clearFormAutoSaveState(
              context, currentOvcHousehold.id, eventId ?? '');
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(const Duration(seconds: 1), () {
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
          preferredSize: const Size.fromHeight(65.0),
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
          body: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Consumer<OvcHouseholdCurrentSelectionState>(
                builder: (context, ovcHouseholdCurrentSelectionState, child) {
                  var currentOvcHousehold =
                      ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      return Column(
                        children: [
                          OvcHouseholdInfoTopHeader(
                            currentOvcHousehold: currentOvcHousehold,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 13.0),
                            child: !isFormReady
                                ? const CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  )
                                : Column(
                                    children: [
                                      EntryFormContainer(
                                        hiddenFields:
                                            serviceFormState.hiddenFields,
                                        hiddenSections:
                                            serviceFormState.hiddenSections,
                                        formSections: formSections,
                                        mandatoryFieldObject: const {},
                                        dataObject: serviceFormState.formState,
                                        isEditableMode:
                                            serviceFormState.isEditableMode,
                                        onInputValueChange: onInputValueChange,
                                      ),
                                      Visibility(
                                        visible:
                                            serviceFormState.isEditableMode,
                                        child: EntryFormSaveButton(
                                          label: isSaving
                                              ? currentLanguage == 'lesotho'
                                                  ? 'E ntse e boloka...'
                                                  : 'Saving ...'
                                              : currentLanguage == 'lesotho'
                                                  ? 'Boloka'
                                                  : 'Save',
                                          labelColor: Colors.white,
                                          buttonColor: const Color(0xFF4B9F46),
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
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer());
  }
}
