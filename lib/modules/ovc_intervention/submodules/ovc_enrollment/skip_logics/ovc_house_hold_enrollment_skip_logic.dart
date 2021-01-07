import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldEnrollmentSkipLogic {
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
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, 'ls9hlz2tyol', age.toString());
      }
      if (dataObject['ls9hlz2tyol'] != null) {
        if (int.parse(dataObject['ls9hlz2tyol']) >= 18) {
          assignInputFieldValue(context, 'oF2lwagPkQA', 'false');
        }
      }

      // if (inputFieldId == 'M9uM11xcHG3' && value != 'true') {
      //   hiddenFields['gybZY8lq4Ky'] = true;
      // }
      if (inputFieldId == 'tNdoR0jYr7R_confirm' && value != 'true') {
        hiddenFields['tNdoR0jYr7R'] = true;
      }
      if (inputFieldId == 'tNdoR0jYr7R_confirm' && value != 'false') {
        hiddenFields['cvrdI9t4rtN_confirm'] = true;
      }
      if (inputFieldId == 'cvrdI9t4rtN_confirm' && value != 'true') {
        hiddenFields['cvrdI9t4rtN'] = true;
        hiddenFields['W7QUtemHnvI'] = true;
      }
    }

    if (dataObject['children'] != null) {
      List<Map> children = dataObject['children'];

      // if (children.every((child) => '${child['YR7Xxk14qoP']}' == 'false')) {
      //   assignInputFieldValue(context, 'mZsmHPVyXV1', 'false');
      // } else {
      //   assignInputFieldValue(context, 'mZsmHPVyXV1', 'true');
      // }

      // if (children.every((child) => '${child['wmKqYZML8GA']}' == 'false')) {
      //   assignInputFieldValue(context, 'M9uM11xcHG3', 'false');
      // } else {
      //   assignInputFieldValue(context, 'M9uM11xcHG3', 'true');
      // }
      try {
        if (children
            .every((child) => int.parse('${child['ls9hlz2tyol']}') > 5)) {
          hiddenFields['NqoQ5BNNoob'] = true;
          hiddenFields['NAMKqy2KVKk'] = true;
        }
      } catch (e) {}
    }

    //Economic Strengthening
    if ((dataObject['oF2lwagPkQA'] != null &&
            "${dataObject['oF2lwagPkQA']}".trim() == 'true') ||
        (dataObject['j0S43gUicDQ'] != null &&
            "${dataObject['j0S43gUicDQ']}".trim() == 'false') ||
        (dataObject['E35x1FwfeW7'] != null &&
            "${dataObject['E35x1FwfeW7']}".trim() == 'false') ||
        (dataObject['DDpCbfzDCIn'] != null &&
            "${dataObject['DDpCbfzDCIn']}".trim() == 'true')) {
      assignInputFieldValue(context, 'ItSpu4jJ4IM', 'true');
    } else {
      assignInputFieldValue(context, 'ItSpu4jJ4IM', 'false');
    }
    if ((dataObject['tIl7nKaeO0K'] != null &&
            "${dataObject['tIl7nKaeO0K']}".trim() == 'false') ||
        (dataObject['rGHJIwsGFhM'] != null &&
            "${dataObject['rGHJIwsGFhM']}".trim() == 'true')) {
      assignInputFieldValue(context, 'jCbVjOXRozX', 'true');
    } else {
      assignInputFieldValue(context, 'jCbVjOXRozX', 'false');
    }
    if ((dataObject['ZPlqhoOZ8YD'] != null &&
            "${dataObject['ZPlqhoOZ8YD']}".trim() == 'false') ||
        (dataObject['UDbgJl7AEse'] != null &&
            "${dataObject['UDbgJl7AEse']}".trim() == 'false') ||
        (dataObject['M9uM11xcHG3'] != null &&
            "${dataObject['M9uM11xcHG3']}".trim() == 'true') ||
        (dataObject['R0U52RV4Cxe'] != null &&
            "${dataObject['R0U52RV4Cxe']}".trim() == 'true')) {
      assignInputFieldValue(context, 'aRRUFQvF8Xs', 'true');
    } else {
      assignInputFieldValue(context, 'aRRUFQvF8Xs', 'false');
    }
    if ((dataObject['UCMMhdQ3OrB'] != null &&
            "${dataObject['UCMMhdQ3OrB']}".trim() == 'true') ||
        (dataObject['NAMKqy2KVKk'] != null &&
            "${dataObject['NAMKqy2KVKk']}".trim() == 'true') ||
        (dataObject['zpnWLMc2oYc'] != null &&
            "${dataObject['zpnWLMc2oYc']}".trim() == 'true') ||
        (dataObject['NqoQ5BNNoob'] != null &&
            "${dataObject['NqoQ5BNNoob']}".trim() == 'true')) {
      assignInputFieldValue(context, 'fX6Amzn0Bpo', 'true');
    } else {
      assignInputFieldValue(context, 'fX6Amzn0Bpo', 'false');
    }
    if ((dataObject['ae9oO3q6zJx'] != null &&
        "${dataObject['ae9oO3q6zJx']}".trim() == 'true')) {
      assignInputFieldValue(context, 'qGcHUqHsIL3', 'true');
    } else {
      assignInputFieldValue(context, 'qGcHUqHsIL3', 'false');
    }
    if ((dataObject['SAlR1x703Ly'] != null &&
            "${dataObject['SAlR1x703Ly']}".trim() == 'true') ||
        (dataObject['rbplnN6qdKz'] != null &&
            "${dataObject['rbplnN6qdKz']}".trim() == 'true') ||
        (dataObject['zFpq6eXlVFX'] != null &&
            "${dataObject['zFpq6eXlVFX']}".trim() == 'true') ||
        (dataObject['WpzsqW5qNs4'] != null &&
            "${dataObject['WpzsqW5qNs4']}".trim() == 'true') ||
        (dataObject['nKzcIaTPLbi'] != null &&
            "${dataObject['nKzcIaTPLbi']}".trim() == 'true') ||
        (dataObject['thdtCERG6s5'] != null &&
            "${dataObject['thdtCERG6s5']}".trim() == 'true') ||
        (dataObject['xNIIkXQdxcO'] != null &&
            "${dataObject['xNIIkXQdxcO']}".trim() == 'true') ||
        (dataObject['mZsmHPVyXV1'] != null &&
            "${dataObject['mZsmHPVyXV1']}".trim() == 'true')) {
      assignInputFieldValue(context, 'Caul8vihx2O', 'true');
    } else {
      assignInputFieldValue(context, 'Caul8vihx2O', 'false');
    }
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hidddenSectionInputFieldIds = FormUtil.getFormFieldIds(allFormSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      List<String> allInputFieldIds = FormUtil.getFormFieldIds(allFormSections
          .where((formSection) => formSection.id != sectionId)
          .toList());
      
      for (String inputFieldId in hidddenSectionInputFieldIds) {
        if (allInputFieldIds.indexOf(inputFieldId) == -1) {
          hiddenFields[inputFieldId] = true;
        }
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
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
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
    String value,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
