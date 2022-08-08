import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsReAssessmentSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

  static Future evaluateSkipLogic(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    Map hiddenOptions = {};
    /**
     * 
      *  Todo - add age evaluation to incoparate into skip logics
            */
    int age = int.parse('${dataObject[''] ?? '0'}');

    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();

    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      //  TODO Add  re-assessment skip logic
      if (inputFieldId == 'XEZ1waTp18L' && value != 'true') {
        hiddenFields['c9CzrUtn7dh'] = true;
        hiddenFields['m1pw5a6ptnD'] = true;
        hiddenFields['cLtX7aavyWx'] = true;
        hiddenFields['e59e3DpsrfO'] = true;
        hiddenFields['w6aNdM4gwi3'] = true;
        hiddenFields['q5CGrIpgap8'] = true;
        hiddenFields['MyWzaD8N5Mw'] = true;
        hiddenFields['ViUk8fZVrVG'] = true;
        hiddenFields['L8pjmifYu5v'] = true;
        hiddenFields['YTYxoL4uvd2'] = true;
        hiddenFields['XThk8GV71oH'] = true;
        hiddenFields['ldEyTeF48Bn'] = true;
        hiddenFields['NMdPGZbGdrJ'] = true;
      }
      if (inputFieldId == 'w6aNdM4gwi3' && value != 'true') {
        hiddenFields['q5CGrIpgap8'] = true;
      }
      if (inputFieldId == 'WHRJJvbbJV2' && value != 'true') {
        hiddenFields['TW5FP6ua1MY'] = true;
      }
      if (inputFieldId == '' && value != 'true') {
        hiddenFields['WHRJJvbbJV2'] = true;
        hiddenFields['TW5FP6ua1MY'] = true;
      }
      if (inputFieldId == 'XEZ1waTp18L' && value != 'true' && age <= 14) {
        hiddenFields['X0xtgjkUJaK'] = true;
        hiddenFields['BnzM3YGOQRC'] = true;
        hiddenFields['ILSjS6lDvGx'] = true;
        hiddenFields['MrxmSdFauSY'] = true;
      }
      if (inputFieldId == 'a1pS345KP53' && value != 'true') {
        hiddenFields['EniWU07LqXa'] = true;
        hiddenFields['DkstiOjXlSh'] = true;
      }
      if (inputFieldId == 'TWvKsmKyCSc') {
        if (value == 'true') {
          hiddenFields['xj9NOs6FeZw'] = true;
        } else {
          hiddenFields['cv8RKCPOOAo'] = true;
          hiddenFields['LPahlcvriGs'] = true;
        }
      }
      if (inputFieldId == 'G1FpSgvl1kK' && value != 'true') {
        hiddenFields['Qxb7zzJ98HI'] = true;
      }
      if (age >= 15) {
        hiddenFields['G1FpSgvl1kK'] = true;
        hiddenFields['Qxb7zzJ98HI'] = true;
      }
      if ( age <= 14) {
        hiddenFields['gN37trYWyOh'] = true;
        hiddenFields['e59e3DpsrfO'] = true;
        hiddenFields['w6aNdM4gwi3'] = true;
        hiddenFields['q5CGrIpgap8'] = true;
      }
      if (age < 20) {
        hiddenFields['LPahlcvriGs'] = true;
      }
      if (inputFieldId == 'a1pS345KP53' && value == 'true') {
        assignInputFieldValue(context, 'RPqwCtEFza8', 'true');
      }
      if (inputFieldId == 'G1FpSgvl1kK' && value == 'true') {
        assignInputFieldValue(context, 'D977px8ADd8', 'true');
      }
      if (inputFieldId == 'TWvKsmKyCSc' && value == 'true') {
        assignInputFieldValue(context, 'K9nfVNC9wQo', 'true');
      }
      if (inputFieldId == 'L8pjmifYu5v' && value == 'true') {
        assignInputFieldValue(context, 'Xij6JPqNHgw', 'true');
      }
      if (inputFieldId == 'WHRJJvbbJV2' && value == 'true') {
        assignInputFieldValue(context, 'LmAeo9S1BFX', 'true');
      }
      if (inputFieldId == 'm1pw5a6ptnD' && value == 'true') {
        assignInputFieldValue(context, 'xqMDWAQ0aST', value);
      }
      if (inputFieldId == 'MrxmSdFauSY' && value == 'false') {
        assignInputFieldValue(context, 'O0rgyBGiBpW', 'true');
      }
      if (inputFieldId == 'gN37trYWyOh' && value == 'true') {
        assignInputFieldValue(context, 'pEZU4tCPJ7m', 'true');
      }
      if (inputFieldId == 'a1pS345KP53' && value == 'true') {
        assignInputFieldValue(context, 'ICt3HySVpyI', 'true');
      }
      if (inputFieldId == 'a1pS345KP53' && value == 'false') {
        assignInputFieldValue(context, 'ICt3HySVpyI', 'false');
      }
      if (inputFieldId == 'GqOBk3DGpby' && value == 'true') {
        assignInputFieldValue(context, 'JRnOh92xlFB', 'true');
      }
      if(inputFieldId =='Qxb7zzJ98HI' && value =='Single Orphan(Father)'){
        assignInputFieldValue(context, 'ac0uJduZGTC', 'No');
      }
       if(inputFieldId =='Qxb7zzJ98HI' && value =='Single Orphan(Mother)'){
        assignInputFieldValue(context, 'OK56Mru7Hwp', 'No');
      }
      if(inputFieldId =='Qxb7zzJ98HI' && value =='Double Orphan'){
        assignInputFieldValue(context, 'OK56Mru7Hwp', 'No');
        assignInputFieldValue(context, 'ac0uJduZGTC', 'No');
      }

      // TODO Add re-enrollment skip logic
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
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenInputFieldOptions(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
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
    String? value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
