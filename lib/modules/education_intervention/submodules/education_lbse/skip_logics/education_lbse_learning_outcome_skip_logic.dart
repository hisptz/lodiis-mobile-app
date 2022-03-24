import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/utils/education_lbse_learning_outcome_util.dart';
import 'package:provider/provider.dart';

class EducationLbseLearningOutcomeSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

  static String beneficairyGradeReference = "beneficiary_grade";
  static String themeReference = "kuMzFGnDULh";
  static String learningOutcomeReference = "mm5ZvlsZ6Sx";

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    Map hiddenLeaningOutcomes = {};
    Map hiddenThemes = {};
    Map<String, List<String>> hiddenLearningOutcomeOptionsMap =
        EducationLbseLearningOutcomeUtil
            .getHiddenLearningOutcomeOptionsMapByGradeAndTheme();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'CQ3GZFbzv5N' && value != 'true') {
        hiddenSections['lbse_referral'] = true;
      }
    }
    String beneficairyGrade = '${dataObject[beneficairyGradeReference]}';
    String selectedTheme = '${dataObject[themeReference]}';
    String learningOutComeFilterKey = "$beneficairyGrade $selectedTheme"
        .split(" ")
        .join("_")
        .trim()
        .toLowerCase();
    if (beneficairyGrade == "Grade 4") {
      hiddenThemes['Theme 4'] = true;
      hiddenThemes['Theme 6'] = true;
      hiddenInputFieldOptions[themeReference] = hiddenThemes;
    } else if (beneficairyGrade == "Grade 6") {
      hiddenThemes['Theme 1'] = true;
      hiddenThemes['Theme 2'] = true;
      hiddenThemes['Theme 5'] = true;
      hiddenThemes['Theme 6'] = true;
      hiddenInputFieldOptions[themeReference] = hiddenThemes;
    } else if (beneficairyGrade == "Grade 10") {
      hiddenThemes['Theme 6'] = true;
      hiddenInputFieldOptions[themeReference] = hiddenThemes;
    }
    if (selectedTheme == "null" || selectedTheme == "") {
      assignInputFieldValue(context, learningOutcomeReference, null);
      for (String key in hiddenLearningOutcomeOptionsMap.keys) {
        for (String id in hiddenLearningOutcomeOptionsMap[key] ?? []) {
          hiddenLeaningOutcomes[id] = true;
        }
      }
    } else {
      for (String id
          in hiddenLearningOutcomeOptionsMap[learningOutComeFilterKey] ?? []) {
        hiddenLeaningOutcomes[id] = true;
      }
    }
    hiddenInputFieldOptions[learningOutcomeReference] = hiddenLeaningOutcomes;
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hiddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hiddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenSections(context, formSections);
    resetValuesForHiddenOptions(context);
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenOptions(
    BuildContext context,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String? value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
