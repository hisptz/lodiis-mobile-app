import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_child_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildEditViewForm extends StatefulWidget {
  const OvcEnrollmentChildEditViewForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentChildEditViewFormState createState() =>
      _OvcEnrollmentChildEditViewFormState();
}

class _OvcEnrollmentChildEditViewFormState
    extends State<OvcEnrollmentChildEditViewForm> {
  List<FormSection>? formSections;
  final String label = 'Child vulnerability form';

  bool _isSaving = false;
  bool _isFormReady = false;

  List<String> mandatoryFields = [];
  final Map mandatoryFieldObject = {};
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    _setFormMetdata();
  }

  void _setFormMetdata() {
    formSections = OvcEnrollmentChild.getFormSections();
    mandatoryFields = OvcEnrollmentChild.getMandatoryField();
    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      const Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await OvcChildEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
      },
    );
  }

  void onSaveForm(
    Map dataObject,
  ) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        _isSaving = true;
      });
      dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
      List<Map> childrenObjects = [];
      childrenObjects.add(dataObject);
      String? parentTrackedEntityInstance =
          dataObject['parentTrackedEntityInstance'];
      String? orgUnit = dataObject['orgUnit'];
      String? enrollmentDate = dataObject['enrollmentDate'];
      String? incidentDate = dataObject['incidentDate'];
      bool shouldEnroll = dataObject['trackedEntityInstance'] == null;
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
        'PN92g65TkVI',
        BeneficiaryIdentification.phoneNumber,
      ];
      await OvcEnrollmentChildService().savingChildrenEnrollmentForms(
        parentTrackedEntityInstance,
        orgUnit,
        childrenObjects,
        enrollmentDate,
        incidentDate,
        shouldEnroll,
        hiddenFields,
      );

      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcList();
      Timer(const Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          setState(() {
            _isSaving = false;
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
          clearFormAutoSaveState();
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
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

  void clearFormAutoSaveState() async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String formAutoSaveId =
        "${OvcRoutesConstant.ovcChildVulnerabilityEditFormPage}_$beneficiaryId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState({
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String id =
        "${OvcRoutesConstant.ovcChildVulnerabilityEditFormPage}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: OvcRoutesConstant.ovcChildVulnerabilityEditFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcChildVulnerabilityEditFormNextPage
          : OvcRoutesConstant.ovcChildVulnerabilityEditFormPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          body: Container(
            child: !_isFormReady
                ? Column(
                    children: const [
                      Center(
                        child: CircularProcessLoader(
                          color: Colors.blueGrey,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Consumer<OvcHouseholdCurrentSelectionState>(
                        builder: (context, ovcHouseholdCurrentSelectionState,
                            child) {
                          OvcHousehold? currentOvcHousehold =
                              ovcHouseholdCurrentSelectionState
                                  .currentOvcHousehold;
                          return OvcHouseholdInfoTopHeader(
                            currentOvcHousehold: currentOvcHousehold,
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 13.0,
                        ),
                        child: Consumer<LanguageTranslationState>(
                          builder: (context, languageTranslationState, child) {
                            String? currentLanguage =
                                languageTranslationState.currentLanguage;
                            return Consumer<EnrollmentFormState>(
                              builder: (context, enrollmentFormState, child) {
                                return Column(
                                  children: [
                                    EntryFormContainer(
                                      hiddenFields:
                                          enrollmentFormState.hiddenFields,
                                      hiddenSections:
                                          enrollmentFormState.hiddenSections,
                                      hiddenInputFieldOptions:
                                          enrollmentFormState
                                              .hiddenInputFieldOptions,
                                      formSections: formSections,
                                      mandatoryFieldObject:
                                          mandatoryFieldObject,
                                      isEditableMode:
                                          enrollmentFormState.isEditableMode,
                                      dataObject: enrollmentFormState.formState,
                                      onInputValueChange: onInputValueChange,
                                      unFilledMandatoryFields:
                                          unFilledMandatoryFields,
                                    ),
                                    Visibility(
                                      visible:
                                          enrollmentFormState.isEditableMode,
                                      child: EntryFormSaveButton(
                                        label: _isSaving
                                            ? 'Saving ...'
                                            : currentLanguage == 'lesotho'
                                                ? 'Boloka'
                                                : 'Save',
                                        labelColor: Colors.white,
                                        buttonColor: const Color(0xFF4B9F46),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveForm(
                                          enrollmentFormState.formState,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
