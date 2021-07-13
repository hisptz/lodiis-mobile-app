import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceFormSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
  static Map hiddenInputFieldOptions = Map();

  static Future evaluateSkipLogics(
      BuildContext context, List<FormSection> formSections, Map dataObject,
      {bool isFormEdited, String implementingPartner}) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    Map hiddenOptions = Map();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }

    inputFieldIds = inputFieldIds.toSet().toList();
    // skip logic as per age
    int agywDreamAge = int.parse(dataObject['age']);
    if (agywDreamAge < 18 || agywDreamAge > 24) {
      hiddenOptions['GBV Legal Messaging'] = true;
    }
    if (agywDreamAge < 10 || agywDreamAge > 17) {
      hiddenOptions['AFLATEEN/TOUN'] = true;
      hiddenOptions['PARENTING'] = true;
      hiddenOptions['VAC Messaging'] = true;
      hiddenOptions['SAVING GROUP'] = true;
      hiddenOptions['VAC Legal Messaging'] = true;
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
      hiddenOptions['GBV Messaging'] = true;
    }
    if (agywDreamAge < 16) {
      hiddenOptions['PTS 4 NON-GRADS'] = true;
    }
    if (agywDreamAge < 15) {
      hiddenOptions['STEPPING STONES'] = true;
      hiddenOptions['IPC'] = true;
    }

    // skip logic as per implementing partner
    if (implementingPartner != 'Paralegal') {
      hiddenOptions['VAC Legal Messaging'] = true;
      hiddenOptions['GBV Legal Messaging'] = true;
    } else {
      hiddenOptions['LBSE'] = true;
      hiddenOptions['FINANCIAL EDUCATION'] = true;
      hiddenOptions['STEPPING STONES'] = true;
      hiddenOptions['IPC'] = true;
      hiddenOptions['PTS 4 NON-GRADS'] = true;
      hiddenOptions['Go Girls'] = true;
      hiddenOptions['PTS 4-GRADS'] = true;
      hiddenOptions['SILC'] = true;
      hiddenOptions['GBV Messaging'] = true;
      hiddenOptions['AFLATEEN/TOUN'] = true;
      hiddenOptions['PARENTING'] = true;
      hiddenOptions['VAC Messaging'] = true;
      hiddenOptions['SAVING GROUP'] = true;
    }
    hiddenInputFieldOptions['Eug4BXDFLym'] = hiddenOptions;

    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      if (inputFieldId == 'Eug4BXDFLym') {
        if ([
              'FINANCIAL EDUCATION',
              'SILC',
              'SAVING GROUP',
              'PTS 4 NON-GRADS',
              'PTS 4-GRADS'
            ].indexOf(value) !=
            -1) {
          hiddenFields['FoLeDcnocv4'] = true;
          hiddenFields['JjX25d72ume'] = true;
          hiddenFields['qxO13pu8vAk'] = true;
        }
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
    resetValuesForHiddenInputFieldOptions(context, formSections);
  }

  static bool evaluateSkipLogicBySessionReoccurrence(Map dataObject) {
    String interventionType = dataObject['Eug4BXDFLym'] ?? '';
    Map sessionsPerInterventions = dataObject['interventionSessions'];
    int currentSession = 0;
    try {
      currentSession = '${dataObject['vL6NpUA0rIU']}' != 'null'
          ? int.parse(dataObject['vL6NpUA0rIU'])
          : currentSession;
    } catch (e) {}

    List interventionSessions =
        sessionsPerInterventions[interventionType] ?? [];
    return interventionType != ''
        ? currentSession != 0 && interventionSessions.contains(currentSession)
        : false;
  }

  static bool evaluateSkipLogicsBySession(Map dataObject) {
    String interventionType = dataObject['Eug4BXDFLym'] ?? '';
    int sessions = 0;
    try {
      sessions = '${dataObject['vL6NpUA0rIU']}' != 'null'
          ? int.parse(dataObject['vL6NpUA0rIU'])
          : sessions;
    } catch (e) {}
    if (sessions >= 0) {
      if (interventionType == 'AFLATEEN/TOUN') {
        return (sessions) <= 12 ? true : false;
      } else if (interventionType == 'PTS 4-GRADS') {
        return (sessions) <= 10 ? true : false;
      } else if (interventionType == 'PTS 4 NON-GRADS') {
        return (sessions) <= 11 ? true : false;
      } else if (interventionType == 'Go Girls') {
        return (sessions) <= 15 ? true : false;
      } else if (interventionType == 'SILC') {
        return (sessions) <= 12 ? true : false;
      } else if (interventionType == 'SAVING GROUP') {
        return (sessions) <= 12 ? true : false;
      } else if (interventionType == 'FINANCIAL EDUCATION') {
        return (sessions) <= 4 ? true : false;
      } else if (interventionType == 'STEPPING STONES') {
        return (sessions) <= 11 ? true : false;
      } else if (interventionType == 'IPC') {
        return (sessions) <= 4 ? true : false;
      } else if (interventionType == 'LBSE') {
        return (sessions) <= 6 ? true : false;
      } else if (interventionType == 'PARENTING') {
        return (sessions) <= 14 ? true : false;
      } else if (interventionType == 'GBV Messaging') {
        return (sessions) <= 1 ? true : false;
      } else if (interventionType == 'VAC Messaging') {
        return (sessions) <= 1 ? true : false;
      } else if (interventionType == 'VAC Legal Messaging') {
        return true;
      } else if (interventionType == 'GBV Legal Messaging') {
        return true;
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
