import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_prep_follow_up_visit.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/constants/prep_intake_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/skip_logics/agyw_prep_visit_skip_logic.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_prep_visit_constant.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywPrepVisitForm extends StatefulWidget {
  AgywPrepVisitForm({Key? key}) : super(key: key);

  @override
  _AgywPrepVisitFormState createState() => _AgywPrepVisitFormState();
}

class _AgywPrepVisitFormState extends State<AgywPrepVisitForm> {
  final String label = 'PREP VISIT';
  List<FormSection>? formSections;
  late List<String> mandatoryFields;
  Map mandatoryFieldsObject = Map();
  bool isFormReady = false;
  bool isSaving = false;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    formSections = DreamsPrepFollowUpVisit.getFormSections();
    mandatoryFields = DreamsPrepFollowUpVisit.getMandatoryField();
    for (String fieldId in mandatoryFields) {
      mandatoryFieldsObject[fieldId] = true;
    }
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
        await AgywPrepSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
        evaluatePrePMandatoryFieldChange(dataObject);
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  void onSaveForm(BuildContext context, Map dataObject, AgywDream? agywDream,
      {hiddenFields: const {}}) async {
    bool hasAllMandatoryFieldsFilled = AppUtil.hasAllMandatoryFieldsFilled(
        mandatoryFields, dataObject,
        hiddenFields: hiddenFields);

    if (hasAllMandatoryFieldsFilled) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            PrepIntakeConstant.program,
            PrepIntakeConstant.prepVisitProgramStage,
            agywDream!.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            agywDream.id,
            eventId,
            hiddenFields);
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(agywDream.id);
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
          clearFormAutoSaveState(context, agywDream.id, eventId ?? '');
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
          });
        });
      }
    } else {
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  void clearFormAutoSaveState(
      BuildContext context, String? beneficiaryId, String eventId) async {
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPrepVisitFormPage}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    var agyw =
        Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
            .currentAgywDream!;
    String? beneficiaryId = agyw.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String eventId = dataObject['eventId'] ?? '';
    String id =
        "${DreamsRoutesConstant.agywDreamsPrepVisitFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: DreamsRoutesConstant.agywDreamsPrepVisitFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : DreamsRoutesConstant.agywDreamsPrepVisitFormNextPage
          : DreamsRoutesConstant.agywDreamsPrepVisitFormPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
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
                return Consumer<DreamsBeneficiarySelectionState>(
                  builder: (context, agywState, child) {
                    AgywDream? agywDream = agywState.currentAgywDream;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        return Container(
                          child: Column(
                            children: [
                              DreamsBeneficiaryTopHeader(
                                agywDream: agywDream,
                              ),
                              !isFormReady
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
                                            hiddenFields:
                                                serviceFormState.hiddenFields,
                                            hiddenSections:
                                                serviceFormState.hiddenSections,
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldsObject,
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            dataObject:
                                                serviceFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                            unFilledMandatoryFields:
                                                unFilledMandatoryFields,
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
                                            buttonColor: Color(0xFF258DCC),
                                            fontSize: 15.0,
                                            onPressButton: () => onSaveForm(
                                                context,
                                                serviceFormState.formState,
                                                agywDream,
                                                hiddenFields: serviceFormState
                                                    .hiddenFields),
                                          ),
                                        )
                                      ],
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

  void evaluatePrePMandatoryFieldChange(Map dataObject) {
    if (dataObject[NonAgywPrepVisitConstant.hivRapidTestId] == 'Positive') {
      setState(() {
        mandatoryFields.add(NonAgywPrepVisitConstant.datePrepStopped);
        mandatoryFieldsObject[NonAgywPrepVisitConstant.datePrepStopped] = true;
      });
    } else {
      if (mandatoryFields.indexOf(NonAgywPrepVisitConstant.datePrepStopped) >
              0 ||
          mandatoryFieldsObject[NonAgywPrepVisitConstant.datePrepStopped] !=
              null) {
        mandatoryFields.remove(NonAgywPrepVisitConstant.datePrepStopped);
        mandatoryFieldsObject.remove(NonAgywPrepVisitConstant.datePrepStopped);
      }
    }
  }
}
