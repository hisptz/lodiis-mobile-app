import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class OvcChildHivAssessmentSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    if ((dataObject['Fz89mIraWIl'] != null &&
            '${dataObject['Fz89mIraWIl']}' == 'Yes') ||
        (dataObject['mIcseDgrIlJ'] != null &&
            '${dataObject['mIcseDgrIlJ']}' == 'Yes') ||
        (dataObject['Hi9fp222l2D'] != null &&
            '${dataObject['Hi9fp222l2D']}' == 'true') ||
        (dataObject['r13f1emAyvw'] != null &&
            '${dataObject['r13f1emAyvw']}' == 'true') ||
        (dataObject['YAugNMbMe2c'] != null &&
            '${dataObject['YAugNMbMe2c']}' == 'true') ||
        (dataObject['niqNMJrfFDs'] != null &&
            '${dataObject['niqNMJrfFDs']}' == 'true') ||
        (dataObject['NhjnHO0IyqY'] != null &&
            '${dataObject['NhjnHO0IyqY']}' == 'true') ||
        (dataObject['LA4G0A6fkNF'] != null &&
            '${dataObject['LA4G0A6fkNF']}' == 'true') ||
        (dataObject['dL8ts5GQcMI'] != null &&
            '${dataObject['dL8ts5GQcMI']}' == 'true') ||
        (dataObject['W64q5maeL6o'] != null &&
            '${dataObject['W64q5maeL6o']}' == 'true') ||
        (dataObject['VJh6KDlBkfb'] != null &&
            '${dataObject['VJh6KDlBkfb']}' == 'true') ||
        (dataObject['SDPCwdDB9yX'] != null &&
            '${dataObject['SDPCwdDB9yX']}' == 'true') ||
        (dataObject['v0ArPi4Rk4o'] != null &&
            '${dataObject['v0ArPi4Rk4o']}' == 'true')) {
      assignInputFieldValue(context, 'hivriskres', 'High risk');
    } else {
      assignInputFieldValue(context, 'hivriskres', 'Low risk');
    }

    // for (String inputFieldId in inputFieldIds) {
    //   String value = '${dataObject[inputFieldId]}';
    // }
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
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
