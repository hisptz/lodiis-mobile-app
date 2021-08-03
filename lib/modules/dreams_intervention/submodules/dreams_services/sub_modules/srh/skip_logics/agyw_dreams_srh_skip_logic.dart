import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsSrhSkipLogic {
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
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'qjMmrl5bpCx' && value != 'true') {
        hiddenFields['XZBP09HGzqn'] = true;
        hiddenFields['kV6uCz4uLLR'] = true;
        hiddenFields['rE25suIpzDK'] = true;
      }
      if (inputFieldId == 'kV6uCz4uLLR' && value != 'Positive') {
        hiddenFields['rE25suIpzDK'] = true;
      }
      if (inputFieldId == 'rE25suIpzDK' && value != 'true') {
        hiddenFields['XdF6espdxoH'] = true;
      }
      if (inputFieldId == 'rE25suIpzDK' && value == 'true') {
        hiddenFields['UZxZebenwuv'] = true;
        hiddenFields['aHpvyQyfyBM'] = true;
      }
      if (inputFieldId == 'UZxZebenwuv' && value != 'true') {
        hiddenFields['aHpvyQyfyBM'] = true;
      }
      if (inputFieldId == 'EKVxsIYImj6' && value != 'true') {
        hiddenFields['ePI1QpCOK7z'] = true;
        hiddenFields['ny2UH7CAZQB'] = true;
      }

      if (inputFieldId == 'C2k7GxU3P5C' && value != 'true') {
        hiddenFields['aYeHcF3793X'] = true;
      }

      if (inputFieldId == 'ukzLG0l63tw' && value != 'Other') {
        hiddenFields['uLV0xy0iihA'] = true;
      }

      if (inputFieldId == 'BXW4IP4Lfe7' && value != 'Other') {
        hiddenFields['Sj45q8zEcqx'] = true;
      }

      if (inputFieldId == 'fPNCS47GeqT' && value != 'Other') {
        hiddenFields['GbYE4IUsK0T'] = true;
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
