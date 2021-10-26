import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class EducationLbseEnrollmentSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
  static Map hiddenInputFieldOptions = Map();

  static String schoolGradeReference = "BUPSEpJySPR";
  static String schoolLevelReference = "UhZhN6s0SNg";
  static String dobReference = "qZP982qpSPS";
  static String ageReference = "ls9hlz2tyol";

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == dobReference) {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, ageReference, age.toString());
      } else if (inputFieldId == schoolLevelReference) {
        String schoolLevel = '${dataObject[inputFieldId]}';
        Map hiddenGrades = Map();
        if (schoolLevel == 'Primary') {
          hiddenGrades["Grade 8"] = true;
          hiddenGrades["Grade 9"] = true;
          hiddenGrades["Grade 10"] = true;
          hiddenGrades["Grade 11"] = true;
        } else if (schoolLevel == 'Post primary') {
          hiddenGrades["Grade 4"] = true;
          hiddenGrades["Grade 5"] = true;
          hiddenGrades["Grade 6"] = true;
          hiddenGrades["Grade 7"] = true;
        } else {
          assignInputFieldValue(context, schoolGradeReference, null);
        }
        hiddenInputFieldOptions[schoolGradeReference] = hiddenGrades;
      }
    }
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
    resetValuesForHiddenOptions(context);
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenSections(context, formSections);
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenOptions(
    BuildContext context,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String? value,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
