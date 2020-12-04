import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

mixin OvcCaseClosureSkipLogic {
  Map hiddenFields = Map();
  Map hiddenSections = Map();

  Future evaluateCaseClosureSkipLogics(
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
      if (inputFieldId != 'S6vcaNyPT5a' && inputFieldId != 'iaVO2v6TsWa') {
        hiddenFields[inputFieldId] = true;
      }
    }
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      // if(inputFieldId == 'S6vcaNyPT5a' ) {
      //   // print(value);
      // }
      if (inputFieldId == 'iaVO2v6TsWa' && value == 'CasePlanAchievement') {
        hiddenFields['Mgvli43II0y'] = false;
        hiddenFields['d1fuqooMhvZ'] = false;
        hiddenFields['HEqBwx1j03q'] = false;
        hiddenFields['P4jYGKdec2j'] = false;
        hiddenFields['P3UeZrhQ3n6'] = false;
        hiddenFields['UR6DHzGAh9V'] = false;
        hiddenFields['aVSqxKj3eUt'] = false;
      }
      if (inputFieldId == 'iaVO2v6TsWa' && value == 'Transfer') {
        hiddenFields['z3oHGQMNcwr'] = false;
        hiddenFields['OXxcaFKJhaB'] = false;
        hiddenFields['F687EjSn2TW'] = false;
        hiddenFields['ZNeMsEdTA8s'] = false;
        hiddenFields['KR0HmxVQwnJ'] = false;
      }
      if (inputFieldId == 'iaVO2v6TsWa' && value == 'Attrition') {
        hiddenFields['rrAzBqK44OE'] = false;
        hiddenFields['NAzhfDNlYIr'] = false;
      }
    }
    for (String sectionId in hiddenSections.keys) {
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      for (String inputFieldId in inputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenSections(context, formSections);
  }

  resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
