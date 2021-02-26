import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:provider/provider.dart';

class AgywDreamsHTCSkipLogic {
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
    dataObject[AgywDreamsHTSLongFormConstant.noOfPartnersDataElementKey] =
        dataObject[AgywDreamsHTSLongFormConstant.noOfPartnersAttributeKey];
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      if ((inputFieldId == 'p2r7Gf6Yqye' && value != 'Other')) {
        hiddenFields['RXHjnbJAMkz'] = true;
      }
      if (inputFieldId == 'EHhaJRS2gqc' && value != 'Other') {
        hiddenFields['OJfuwI9k15B'] = true;
      }

      if (inputFieldId == 'C2k7GxU3P5C' && value != 'true') {
        hiddenFields['aYeHcF3793X'] = true;
      }
      if (inputFieldId == 'UlombfpCloG' && value != 'Couple') {
        hiddenFields['hWdE0MXmeuP'] = true;
      }
      if (inputFieldId == 'GSLu0wyCCsP' && value != 'Other') {
        hiddenFields['aoWp3tKXOqa'] = true;
      }

      if (inputFieldId == 'HXUTJfK4T6V' && value != 'true') {
        hiddenFields['f8irSIFCXDF'] = true;
        hiddenFields['JL1rGyJaDnw'] = true;
        hiddenFields['j2qNW9NsNBv'] = true;
      }

      if (inputFieldId == 'CR5xUFmPHVy' && value != 'true') {
        hiddenFields['ODv7ghspcbG'] = true;
      }

      if ('${dataObject['gCvMVscBNfk']}' != 'null' &&
          '${dataObject['x7Jzm67o0Ng']}' != 'null') {
        dataObject['gCvMVscBNfk_bmi'] = calculateBMI(
            '${dataObject['gCvMVscBNfk']}', '${dataObject['x7Jzm67o0Ng']}');
      }
      if (inputFieldId == 'mhZeM9CuGQn' && value != 'null') {
        assignInputFieldValue(context, 'uRsImCXXDXe', value);
      }
      if (inputFieldId == 'NpGma0GzvBk' && value != 'true') {
        hiddenFields['Mcoc57TzQwX'] = true;
        hiddenFields['O2IpQLJ64pU'] = true;
        hiddenFields['MIda6PYnDe3'] = true;
        hiddenFields['fPzwReDDMya'] = true;
        hiddenFields['YstOYReVQSu'] = true;
        hiddenFields['HPzl16DToJQ'] = true;
        hiddenFields['DGxRatLifox'] = true;
        hiddenFields['rvanxUEglQu'] = true;
      }
    }
    List<String> fields = ['Mcoc57TzQwX', 'O2IpQLJ64pU'];
    bool shouldShowNameOfFacilityField =
        fields.any((field) => '${dataObject[field]}' == 'true');
    if (!shouldShowNameOfFacilityField) {
      hiddenFields['rvanxUEglQu'] = true;
    }
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

  static String calculateBMI(weight, height) {
    double bmi;
    try {
      bmi =
          double.parse(weight) / (double.parse(height) * double.parse(height));
    } catch (e) {}
    return bmi != null ? bmi.toStringAsPrecision(3) : '';
  }
}
