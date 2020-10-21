import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class OvcChildWellBeingAssessmentSkipLogic {
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
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'vCSvOI0d9M4' && value != 'true') {
        hiddenFields['NAqMo0LwqZR'] = true;
      }
      if (inputFieldId == 'TH3xvl6NZhi' && value != 'true') {
        hiddenFields['wOlSzC2ovZN'] = true;
      }
      if (inputFieldId == 'DaVKi2U248S' && value != 'true') {
        hiddenFields['TWvKsmKyCSc'] = true;
        hiddenFields['DaVKi2U248S_checkbox'] = true;
        hiddenFields['fcWZ0cctQlO'] = true;
        hiddenFields['nbLQCi1YrvU'] = true;
        hiddenFields['JMGxn39tjoh'] = true;
        hiddenFields['qPt9jvB5ACh'] = true;
        hiddenFields['giEyqjovyAp'] = true;
        hiddenFields['Q5MH7cmdlhT'] = true;
        hiddenFields['WIrF2dIAkqD'] = true;
        hiddenFields['kamr81y5WJs'] = true;
      }
      if (inputFieldId == 'kamr81y5WJs' && value != 'true') {
        hiddenFields['wZ6HnbTdfDg'] = true;
      }
      if (inputFieldId == 'emR9ocfi1Vm' && value != 'true') {
        hiddenFields['cv8RKCPOOAo'] = true;
      }
      if (inputFieldId == 'OyloI2gUb2p' && value != 'true') {
        hiddenFields['Ey6WeeJVCI7'] = true;
      }
      if (inputFieldId == 'ot2CtK0hAHo' && value != 'true') {
        hiddenFields['VMP6xJWkWHK'] = true;
      }
      if (inputFieldId == 'mtZfZIAkVjt' && value != 'true') {
        hiddenFields['mtZfZIAkVjt_checkbox'] = true;
        hiddenFields['qK6pCo37tWW'] = true;
        hiddenFields['Tbga457Gs8B'] = true;
        hiddenFields['AYqiBBgPBsR'] = true;
        hiddenFields['I42XGV43sC7'] = true;
        hiddenFields['F8cC7TI5t9b'] = true;
        hiddenFields['MNYYB8orI36'] = true;
      }
      if (inputFieldId == 'F8cC7TI5t9b' && value != 'true') {
        hiddenFields['MNYYB8orI36'] = true;
      }
      if (inputFieldId == 'OBugEkynJG0' && value != 'true') {
        hiddenFields['OBugEkynJG0_checkbox'] = true;
        hiddenFields['UHMtTnEP9Yh'] = true;
        hiddenFields['JuHzVswoDKw'] = true;
        hiddenFields['G5EFtvf5qcF'] = true;
        hiddenFields['g8j8aNxz7lh'] = true;
        hiddenFields['W9bFXNhcWHN'] = true;
        hiddenFields['B7i1JLk1GIk'] = true;
        hiddenFields['SSUQsWk0JiA'] = true;
        hiddenFields['FmJ0mLOhMSd'] = true;
        hiddenFields['xQjn7WKtJvm'] = true;
      }
      if (inputFieldId == 'FmJ0mLOhMSd' && value != 'true') {
        hiddenFields['xQjn7WKtJvm'] = true;
      }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
      // if (inputFieldId == '' && value != 'true') {
      //   hiddenFields[''] = true;
      // }
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
