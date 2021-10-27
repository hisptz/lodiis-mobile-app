import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
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
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/models/ovc_exit_information.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/constants/ovc_exit_information_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/skip_logics/ovc_case_exit_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcExitInformationForm extends StatefulWidget {
  @override
  _OvcExitInformationFormState createState() => _OvcExitInformationFormState();
}

class _OvcExitInformationFormState extends State<OvcExitInformationForm>
    with OvcCaseExitSkipLogic {
  final String label = 'Exit';
  final String translatedLabel = 'Koalac';
  List<FormSection>? formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcExitInformation.getFormSections();
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
        await evaluateCaseExitSkipLogics(
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
        "${OvcRoutesConstant.ovcExitFormPage}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    var ovc =
        Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
            .currentOvcHouseholdChild!;
    String? beneficiaryId = ovc.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String eventId = dataObject['eventId'] ?? '';
    String id =
        "${OvcRoutesConstant.ovcExitFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: OvcRoutesConstant.ovcExitFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcExitFormNextPage
          : OvcRoutesConstant.ovcExitFormPage,
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
    OvcHouseholdChild? currentOvcHouseholdChild,
  ) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcExitInformationConstant.program,
            OvcExitInformationConstant.programStage,
            currentOvcHouseholdChild!.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            currentOvcHouseholdChild.id,
            eventId,
            null);
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHouseholdChild.id);

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
          clearFormAutoSaveState(
              context, currentOvcHouseholdChild.id, eventId ?? '');
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
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Consumer<InterventionCardState>(
                builder: (context, interventionCardState, child) {
                  InterventionCard activeInterventionProgram =
                      interventionCardState.currentInterventionProgram;
                  return SubPageAppBar(
                    label:
                        currentLanguage == 'lesotho' ? translatedLabel : label,
                    activeInterventionProgram: activeInterventionProgram,
                  );
                },
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
                    OvcHouseholdChild? currentOvcHouseholdChild =
                        ovcHouseholdCurrentSelectionState
                            .currentOvcHouseholdChild;
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
                                              hiddenSections: hiddenSections,
                                              hiddenFields: hiddenFields,
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
                                                  currentOvcHouseholdChild),
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
