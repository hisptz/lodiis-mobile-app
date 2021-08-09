import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_without_enrollment_criteria_constants.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_without_enrollment_criteria_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/skip_logics/agyw_dreams_enrollment_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';
import 'agyw_dreams_enrollment_form.dart';

class AgywDreamsRiskAssessment extends StatefulWidget {
  const AgywDreamsRiskAssessment({Key key}) : super(key: key);
  @override
  _AgywDreamsRiskAssessmentState createState() =>
      _AgywDreamsRiskAssessmentState();
}

class _AgywDreamsRiskAssessmentState extends State<AgywDreamsRiskAssessment> {
  List<FormSection> formSections;
  final String label = 'Risk Assessment';
  final List<String> mandatoryFields =
      AgywEnrollmentRiskAssessment.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;
  List unFilledMandatoryFields = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = AgywEnrollmentRiskAssessment.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await AgywDreamsEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
  }) async {
    String beneficiaryId = "";
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String id = "${DreamsRoutesConstant.agywConsentPage}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: DreamsRoutesConstant.agywRiskAssessmentPage,
      nextPageModule: isSaveForm
          ? DreamsRoutesConstant.agywRiskAssessmentNextPage
          : DreamsRoutesConstant.agywRiskAssessmentPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    if (id == 'ls9hlz2tyol') {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .removeFieldFromState('UzQ533pOnvt');
    }
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  bool hasEnrollmentCriteria(Map dataObject) {
    List<String> enrollmentCriteria = [
      'B4ojlzKypUF',
      'HJIHPjOf5s1',
      'bApA6X6TVvJ',
      'yc3BlUIEup3',
      'p33MrrhsQRz',
      'iY67qYnywgS',
      'rh881j2vfvT',
      'AZCVLPzD0Vd',
    ];
    for (var criteria in enrollmentCriteria) {
      if (dataObject[criteria] != null && dataObject[criteria] != '') {
        return true;
      }
    }

    return false;
  }

  void onSaveAndContinue(BuildContext context, Map dataObject,
      {Map hiddenFields = const {}}) {
    bool hadAllMandatoryFilled = AppUtil.hasAllMandatoryFieldsFilled(
        mandatoryFields, dataObject,
        hiddenFields: hiddenFields);
    if (hadAllMandatoryFilled) {
      onUpdateFormAutoSaveState(context, isSaveForm: true);
      bool beneficiaryHasEnrollmentCriteria = hasEnrollmentCriteria(dataObject);
      if (!beneficiaryHasEnrollmentCriteria) {
        final List<AgywDreamsWithoutEnrollmentCriteriaConstant>
            agywWithoutEnrollmentConstants =
            AgywDreamsWithoutEnrollmentCriteriaConstant
                .getDreamsWithoutEnrollmentCriteriaConstants();
        for (AgywDreamsWithoutEnrollmentCriteriaConstant agywConstant
            in agywWithoutEnrollmentConstants) {
          String dataElement = agywConstant.dataElement;
          String attribute = agywConstant.attribute;
          if (dataObject.keys.toList().indexOf(attribute) != -1) {
            Provider.of<EnrollmentFormState>(context, listen: false)
                .setFormFieldState(dataElement, dataObject[attribute]);
          }
        }
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => beneficiaryHasEnrollmentCriteria
              ? AgywDreamsEnrollmentForm()
              : AgywDreamsWithoutEnrollmentCriteriaForm(),
        ),
      );
    } else {
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            margin: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 13.0,
            ),
            child: !isFormReady
                ? Column(
                    children: [
                      Center(
                        child: CircularProcessLoader(
                          color: Colors.blueGrey,
                        ),
                      )
                    ],
                  )
                : Container(
                    child: Consumer<LanguageTranslationState>(
                      builder: (context, languageTranslationState, child) {
                        String currentLanguage =
                            languageTranslationState.currentLanguage;
                        return Consumer<EnrollmentFormState>(
                          builder: (context, enrollmentFormState, child) =>
                              Column(
                            children: [
                              Container(
                                child: EntryFormContainer(
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields,
                                  hiddenSections:
                                      enrollmentFormState.hiddenSections,
                                  hiddenInputFieldOptions: enrollmentFormState
                                      .hiddenInputFieldOptions,
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                ),
                              ),
                              EntryFormSaveButton(
                                label: currentLanguage == 'lesotho'
                                    ? 'Boloka ebe u fetela pele'
                                    : 'Save and Continue',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF258DCC),
                                fontSize: 15.0,
                                onPressButton: () => onSaveAndContinue(
                                  context,
                                  enrollmentFormState.formState,
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
