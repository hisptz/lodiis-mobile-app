import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_child_form_constant.dart';
import 'package:provider/provider.dart';

class OvcChildEnrollmentSkipLogic {
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
        if (age > 2) {
          hiddenFields['GMcljM7jbNG'] = true;
        }
        if (age < 2) {
          hiddenSections['domainschooltsasekolo'] = true;
        }
      }
         if (inputFieldId == 'iS9mAp3jDaU' &&
          (value.isEmpty || '$value'.trim() != 'Biological mother')) {
        hiddenFields['nOgf8LKXS4k'] = true;
      }

      if (inputFieldId == 'UeF4OvjIIEK' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['nOgf8LKXS4k'] = true;
      }
      if (inputFieldId == 'wmKqYZML8GA' &&
          (value.isEmpty || '$value'.trim() == 'true')) {
        hiddenFields['GMcljM7jbNG'] = true;
      }
      if (inputFieldId == 'Gkjp5XZD70V' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['Sa0KVprHUr7'] = true;
        hiddenFields['wtrZQadTkOL'] = true;
        hiddenFields['Mc3k3bSwXNe'] = true;
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'Mc3k3bSwXNe' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'CePNVGSnj00' &&
          (value.isEmpty || '$value'.trim() != 'Other')) {
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'YR7Xxk14qoP' && value != 'true') {
        hiddenFields['YR7Xxk14qoP_checkbox'] = true;
      }
      if (inputFieldId == 'omUPOnb4JVp' && value != 'true') {
        hiddenFields['WsmWkkFBiT6'] = true;
      }
    }
    assignPrimaryVulnerability(context, dataObject);
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

  static assignPrimaryVulnerability(BuildContext context, Map dataObject) {
    List<String> vulnerabilities = [
      'wmKqYZML8GA',
      'GMcljM7jbNG',
      'br1xvwAQ6el',
      'ZKMhrjWoXnD',
      'Gkjp5XZD70V',
      'UeF4OvjIIEK',
      'YR7Xxk14qoP'
    ];
    List<String> primaryVulnerabilitiesOptions = [
      'Child living with HIV',
      'HIV exposed infants',
      'Child of a sex worker (FSW)',
      'Child of PLHIV',
      'Child exposed/experiencing violence and abuse (Survivors of Vac)',
      'Orphan',
      'Child living with disability'
    ];
    for (var vulnerabilityKey in vulnerabilities) {
      if (dataObject[vulnerabilityKey] == true) {
        assignInputFieldValue(
            context,
            OvcEnrollmentChildConstant.primaryVulnerabilityKey,
            primaryVulnerabilitiesOptions[
                vulnerabilities.indexOf(vulnerabilityKey)]);
        break;
      } else
        continue;
    }
    if (vulnerabilities.every((element) =>
        (dataObject[element] == false || dataObject[element] == null))) {
      assignInputFieldValue(
          context, OvcEnrollmentChildConstant.primaryVulnerabilityKey, null);
    }
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
    String? value,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
