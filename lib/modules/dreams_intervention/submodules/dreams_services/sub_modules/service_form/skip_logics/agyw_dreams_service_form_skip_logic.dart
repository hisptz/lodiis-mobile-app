import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceFormSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
  static Map hiddenInputFieldOptions = Map();

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
      //  @TODO Add skip logics
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
    evaluateSkipLogicsByAgywAge(context, formSections, dataObject);
  }

  static evaluateSkipLogicsByAgywAge(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) {
    int agywDreamAge = int.parse(dataObject['age']);
    Map hiddenOptions = Map();
    if (agywDreamAge < 10 || agywDreamAge > 17) {
      hiddenOptions['AFLATEEN/TOUN'] = true;
      hiddenOptions['PARENTING'] = true;
      hiddenOptions['VAC Legal'] = true;
      hiddenOptions['SAVING GROUP'] = true;
    }
    if (agywDreamAge < 10 || agywDreamAge > 19) {
      hiddenOptions['LBSE'] = true;
    }
    if (agywDreamAge < 10) {
      hiddenOptions['FINANCIAL EDUCATION'] = true;
    }
    if (agywDreamAge < 18) {
      hiddenOptions['Go Girls'] = true;
      hiddenOptions['PTS 4-GRADS'] = true;
      hiddenOptions['SILC'] = true;
      hiddenOptions['GBV Legal'] = true;
    }
    if (agywDreamAge < 16) {
      hiddenOptions['PTS 4 NON-GRADS'] = true;
    }
    if (agywDreamAge < 15) {
      hiddenOptions['STEPPING STONES'] = true;
      hiddenOptions['IPC'] = true;
    }

    hiddenInputFieldOptions['Eug4BXDFLym'] = hiddenOptions;
    resetValuesForHiddenInputFieldOptions(context, formSections);
  }

  static bool evaluateSkipLogicsBySession(Map dataObject) {
    String interventionType = dataObject['Eug4BXDFLym'] ?? '';
    Map eventSessions = dataObject['eventSessions'] ?? Map();
    int previousSession = eventSessions[interventionType] ?? 0;
    int sessions = 0;
    try {
      sessions = '${dataObject['vL6NpUA0rIU']}' != 'null'
          ? int.parse(dataObject['vL6NpUA0rIU'])
          : sessions;
    } catch (e) {}
    print(dataObject);
    if (sessions != 0) {
      if (interventionType == 'AFLATEEN/TOUN') {
        return (sessions + previousSession) <= 12 ? true : false;
      } else if (interventionType == 'PTS 4-GRADS') {
        return (sessions + previousSession) <= 10 ? true : false;
      } else if (interventionType == 'PTS 4 NON-GRADS') {
        return (sessions + previousSession) <= 11 ? true : false;
      } else if (interventionType == 'Go Girls') {
        return (sessions + previousSession) <= 15 ? true : false;
      } else if (interventionType == 'SILC') {
        return (sessions + previousSession) <= 12 ? true : false;
      } else if (interventionType == 'SAVING GROUP') {
      } else if (interventionType == 'FINANCIAL EDUCATION') {
        return (sessions + previousSession) <= 14 ? true : false;
      } else if (interventionType == 'STEPPING STONES') {
        return (sessions + previousSession) <= 11 ? true : false;
      } else if (interventionType == 'IPC') {
        return (sessions + previousSession) <= 4 ? true : false;
      } else if (interventionType == 'LBSE') {
        return (sessions + previousSession) <= 6 ? true : false;
      } else if (interventionType == 'PARENTING') {
        return (sessions + previousSession) <= 14 ? true : false;
      } else if (interventionType == 'GBV Legal') {
        return (sessions + previousSession) <= 1 ? true : false;
      } else if (interventionType == 'VAC Legal') {
        return (sessions + previousSession) <= 1 ? true : false;
      }
    }
    return false;
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

  static resetValuesForHiddenInputFieldOptions(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
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
