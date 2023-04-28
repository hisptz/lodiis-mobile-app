import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class EducationBursaryEnrollmentSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

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
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue(context, 'ls9hlz2tyol', age.toString());
        if (age >= 13 && age <= 17) {
          assignInputFieldValue(context, 'S1fa4zCDYEC', 'true');
        } else {
          assignInputFieldValue(context, 'S1fa4zCDYEC', '');
        }
      }
      if (inputFieldId == 'pJ5NAEmwnDq' && value != 'false') {
        hiddenFields['cYn1nmlwBdW'] = true;
      }
      if (inputFieldId == 'WXhb5L2Zisd' && value != 'false') {
        hiddenFields['qWXojsKR6VU'] = true;
      }
      if (inputFieldId == 'OL0bjS9XQsh' && value != 'false') {
        hiddenFields['Ze2W9vkrfrL'] = true;
        hiddenFields['why_not_schooling'] = true;
      }
      if (inputFieldId == 'Ze2W9vkrfrL' && value != 'false') {
        hiddenFields['zLn55LntBLP'] = true;
      }
      if (inputFieldId == 'KiTvHDkvi8J' && (value != '' || value != 'null')) {
        hiddenFields['not_enrolled_reason'] = true;
      }
      if (inputFieldId == 'om8s3kpQnjI' && value != 'true') {
        hiddenFields['ZhNIc0pp5IC'] = true;
      }
      if (inputFieldId == 'C524HuWqRyt' && value != 'Other') {
        hiddenFields['FCS9lp9uaTW'] = true;
      }
      if (inputFieldId == 'IVjlzXHizyT' && value != 'Other') {
        hiddenFields['rHXVmf70LCM'] = true;
      }
      if (inputFieldId == 'RIhVna2gMyU' && value != 'true') {
        hiddenFields['z4z7ow7yriM'] = true;
      }
      if (inputFieldId == 'AI5HI4sMmH9' && value != 'true') {
        hiddenFields['BnYxw1cOirn'] = true;
      }
      if (inputFieldId == 'SBulXSQB2yA' && value != 'true') {
        hiddenFields['l9thzEZzGrK'] = true;
      }
      if (inputFieldId == 'n60llwHJIc2' && value != 'true') {
        hiddenFields['rzeyShjMVHO'] = true;
      }
      if (inputFieldId == 'eQs6QgpZFFl' && value != 'true') {
        hiddenFields['FMLuCvm2yTI'] = true;
      }
      if (inputFieldId == 'X0oEMbsnbRp' && value != 'true') {
        hiddenFields['ziBNi3VfdQU'] = true;
      }
      if (inputFieldId == 'e9JhEYUkO4V' && value != 'true') {
        hiddenFields['o4Bi74oylwo'] = true;
      }
      if (inputFieldId == 'DZWBn9lpEVu' && value != 'true') {
        hiddenFields['Z0XaEgRPvkM'] = true;
      }
      if (inputFieldId == 'CM64InhpVVd' && value != 'true') {
        hiddenFields['yKUVT2msSLT'] = true;
      }
      if (inputFieldId == 'vzuGxvADAQ1' && value != 'true') {
        hiddenFields['QBxpDou3jlE'] = true;
      }
      if (inputFieldId == 'YTfNinzrOGA' && value != 'true') {
        hiddenFields['pkVU7LVIO9W'] = true;
      }
      if (inputFieldId == 'LSJjze7HV3w' && value != 'true') {
        hiddenFields['WoSdTNgH4Mz'] = true;
      }
      if (inputFieldId == 'juGeWTcD9LL' && value != 'true') {
        hiddenFields['LtyzmIBWl7w'] = true;
      }
      if (inputFieldId == 'o67RKCxvNCy' && value != 'true') {
        hiddenFields['VQbVQea2s7n'] = true;
      }
      if (inputFieldId == 'OeEHpwWkzgf' && value != 'true') {
        hiddenFields['ykg7pxiVcSc'] = true;
      }
      if (inputFieldId == 'dUwwS3Gp7OU' && value != 'true') {
        hiddenFields['BjIO7hTeor3'] = true;
      }
      if (inputFieldId == 'h2LrMC9ep8E' && value != 'true') {
        hiddenFields['Ha1E9m1x3Nn'] = true;
      }
      if (inputFieldId == 'dWKnZE5xkfk' && value != 'true') {
        hiddenFields['JsNImCkS1gh'] = true;
      }
      if (inputFieldId == 'JW3YHXh0oVQ' && value != 'true') {
        hiddenFields['fSWNHF4MmTl'] = true;
      }
      if (inputFieldId == 'hxWJ7bGS2Lh' && value != 'true') {
        hiddenFields['TwKzPVRTdR1'] = true;
      }
      if (inputFieldId == 'w3mmK0ZhKHm' && value != 'true') {
        hiddenFields['gNn6fGxFBvu'] = true;
      }
      if (inputFieldId == 'YkVyjaNi5Bp' && value != 'true') {
        hiddenFields['EQIf299WMiS'] = true;
      }
      if (inputFieldId == 'hE4PMNfJxTW' && value != 'true') {
        hiddenFields['H5glFCPsa9n'] = true;
      }
      if (inputFieldId == 'vIX4GTSCX4P') {
        Map hiddenRelationshipsWithChild = {};
        if (value == 'Male') {
          hiddenFields['oIGWbCQTZ8w'] = true;
          hiddenRelationshipsWithChild['Daughter'] = true;
          hiddenRelationshipsWithChild['Granddaughter'] = true;
        } else if (value == 'Female') {
          hiddenRelationshipsWithChild['Son'] = true;
          hiddenRelationshipsWithChild['Grandson'] = true;
        }
        hiddenInputFieldOptions['C524HuWqRyt'] = hiddenRelationshipsWithChild;
      }

      if (inputFieldId == 'vQ7hj9nTgo7') {
        if ([
          "Dropped out plan to return",
          "Dropped out no plan to return",
          "Never enrolled"
        ].contains(value)) {
          hiddenFields['KiTvHDkvi8J'] = true;
        }
      }

      // Vulnerability Criteria
      if (inputFieldId == 'Ne8BaB6rCZX') {
        String caregiverStatus = '${dataObject['nXvf0gcppF5']}';
        if (value == 'true') {
          if (caregiverStatus == 'Neither alive') {
            assignInputFieldValue(context, 'JfPUDRFSM2z', 'true');
          } else if (caregiverStatus == 'Father alive' ||
              caregiverStatus == 'Mother alive') {
            assignInputFieldValue(context, 'bgIhCSdcf3S', 'true');
          } else {
            assignInputFieldValue(context, 'JfPUDRFSM2z', '');
            assignInputFieldValue(context, 'bgIhCSdcf3S', '');
          }
        } else {
          assignInputFieldValue(context, 'JfPUDRFSM2z', '');
          assignInputFieldValue(context, 'bgIhCSdcf3S', '');
        }
      }
      if (inputFieldId == 'ScwpdvuKFhg') {
        String caregiverStatus = '${dataObject['nXvf0gcppF5']}';
        String costOfFee = '${dataObject['Ne8BaB6rCZX']}';
        String frequencyOfHouseHoldEating = '${dataObject['x7HZOLCazVg']}';
        String caregiverCannotAffordNecessities =
            '${dataObject['Ne8BaB6rCZX']}';
        if (caregiverStatus == 'Both alive' &&
            (costOfFee == 'true' ||
                caregiverCannotAffordNecessities == 'true' ||
                frequencyOfHouseHoldEating == '1 to 2 times' ||
                frequencyOfHouseHoldEating == 'Often 0')) {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else {
          assignInputFieldValue(context, inputFieldId, '');
        }
      }
      if (inputFieldId == 'FbYzrCTLoHz') {
        String childUnderCareOf = '${dataObject['IVjlzXHizyT']}';
        if (childUnderCareOf != 'Both parents' &&
            childUnderCareOf != 'null' &&
            childUnderCareOf != '') {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else {
          assignInputFieldValue(context, inputFieldId, '');
        }
      }
      if (inputFieldId == 'ap2txsDKTLL') {
        String childDiabled = '${dataObject['zQPns75P1XA']}';
        if (childDiabled == 'true') {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else {
          assignInputFieldValue(context, inputFieldId, '');
        }
      }
      if (inputFieldId == 'tL9duNsv8BE') {
        String grade = '${dataObject['tbzi0t27D8l']}';
        if (grade != '' && grade != 'null') {
          assignInputFieldValue(context, inputFieldId, 'true');
        } else {
          assignInputFieldValue(context, inputFieldId, '');
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
    resetValuesForHiddenInputFieldOptions(context);
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

  static resetValuesForHiddenInputFieldOptions(
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
