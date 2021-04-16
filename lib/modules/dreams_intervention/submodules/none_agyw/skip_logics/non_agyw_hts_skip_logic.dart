import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class NonAgywDreamsHTCSkipLogic {
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
    Map hiddenOptions = Map();
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
      if (inputFieldId == 'vIX4GTSCX4P' && value == 'Female') {
        hiddenOptions['Circumsized'] = true;
      }
      if ((inputFieldId == 'J53jgfHiufC' && value != 'Other')) {
        hiddenFields['ybq5BQOdMG6'] = true;
      }
      if (inputFieldId == 'G86T8BY1eVL' && value != 'Other') {
        hiddenFields['YzPuEq2nAIh'] = true;
      }

      if (inputFieldId == 'sJ35hsF6Lf9' && value != 'Couple') {
        hiddenFields['XjHuTmtsXsz'] = true;
      }
      if (inputFieldId == 'Lam6bSq1Zgk' && value != 'Other') {
        hiddenFields['w6kNR0e4G6V'] = true;
      }

      if (inputFieldId == 'qvXYyTK9h2m' && value != 'true') {
        hiddenFields['ZxXscC5W9qb'] = true;
        hiddenFields['ECSlqcSEB9D'] = true;
        hiddenFields['z50tGzpCAow'] = true;
      }
      if (inputFieldId == 'mmK9CT0n9BV' && value != 'true') {
        hiddenFields['i0U8S4F3rTa'] = true;
        hiddenFields['HD5YrKZXzQl'] = true;
        hiddenFields['dOUKOAUsIgD'] = true;
        hiddenFields['WZYXR6Azijc'] = true;
        hiddenFields['XAHL4Ldyv3P'] = true;
        hiddenFields['eBHVZQ8jWOm'] = true;
        hiddenFields['odSWc26b9P6'] = true;
        hiddenFields['ZZBWYb9jzHE'] = true;
      }
      if (inputFieldId == 'RXS4fNXVKMl' && value != 'true') {
        hiddenFields['LZFhD0N9Zj5'] = true;
      }
      // if ('${dataObject['eXp9ASOufpR']}' != 'null' &&
      //     '${dataObject['qsujYWhB0DP']}' != 'null') {
      //   dataObject['eXp9ASOufpR_bmi'] = calculateBMI(
      //       '${dataObject['eXp9ASOufpR']}', '${dataObject['qsujYWhB0DP']}');
      // }
      if (inputFieldId == 'vkd6o91n1IC') {
        if (dataObject['vIX4GTSCX4P'] == 'Male') {
          dataObject[inputFieldId] = 'NON-AGYW';
        } else if (dataObject['vIX4GTSCX4P'] == 'Female') {
          int age = int.parse('${dataObject['ls9hlz2tyol'] ?? '0'}');
          if (age >= 15 && age <= 24) {
            dataObject[inputFieldId] = 'AGYW';
          } else {
            dataObject[inputFieldId] = 'NON-AGYW';
          }
        }
      }
    }
    List<String> fields = ['i0U8S4F3rTa', 'HD5YrKZXzQl'];
    bool shouldShowNameOfFacilityField =
        fields.any((field) => '${dataObject[field]}' == 'true');
    if (!shouldShowNameOfFacilityField) {
      hiddenFields['ZZBWYb9jzHE'] = true;
    }
    hiddenInputFieldOptions['VlLCik7OLHI'] = hiddenOptions;
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hidddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hidddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenInputFieldOptions(context, formSections);
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
    List<FormSection> formSections,
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
    String value,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }

  static String calculateBMI(weight, height) {
    double bmi;
    try {
      bmi =
          double.parse(weight) / (double.parse(height) * double.parse(height));
    } catch (e) {}
    return bmi != null ? bmi.toStringAsPrecision(3) : '';
  }
}
