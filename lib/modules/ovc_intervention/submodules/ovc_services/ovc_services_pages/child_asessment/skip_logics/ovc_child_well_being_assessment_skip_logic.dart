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
      //Logic change
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
      if (inputFieldId == 'Vc7Q23oTNhu' && value != 'true') {
        hiddenFields['qI9a8II1g54'] = true;
        hiddenFields['ToOqcUP9338'] = true;
      }
      if (inputFieldId == 'TQGFUJ7MTPu' && value != 'true') {
        hiddenFields['lz56QGytZkD'] = true;
        hiddenFields['lxF2SNfIGa0'] = true;
        hiddenFields['YZ9ORZBKzHk'] = true;
      }
      if (inputFieldId == 'RC28ZyOhzUQ' && value != 'true') {
        hiddenFields['RC28ZyOhzUQ_checkbox'] = true;
        hiddenFields['rVAImAgvrYe'] = true;
        hiddenFields['br8TVOKf1ZI'] = true;
        hiddenFields['DExMWJ61fKp'] = true;
        hiddenFields['LJO2Ar9YytV'] = true;
        hiddenFields['e1KcALoo1ZJ'] = true;
        hiddenFields['YRWFyAhfhRP'] = true;
        hiddenFields['YQVQRnN30O6'] = true;
      }
      if (inputFieldId == 'YRWFyAhfhRP' && value != 'true') {
        hiddenFields['YQVQRnN30O6'] = true;
      }
      if (inputFieldId == 'uMwExnG6Flk' && value != 'true') {
        hiddenFields['wO2o2ZqG65D'] = true;
      }
      if (inputFieldId == 'ef1ixon3YBh' && value != 'true') {
        hiddenFields['J4ozQS4koE8'] = true;
      }
      if (inputFieldId == 'o2XWRHW5zwb' && value != 'true') {
        hiddenFields['eSJhbqT1NQb'] = true;
      }
      if (inputFieldId == 'bgJkdPrTnbg' && value != 'Other') {
        hiddenFields['Z51O61hlZMR'] = true;
      }
      if (inputFieldId == 'Tr5lrn4ctTN' && value != 'Other') {
        hiddenFields['YTa10rE1vtd'] = true;
      }
      if (inputFieldId == 'f2GIuwu1LGh' && value != 'Other') {
        hiddenFields['DrPdwo3pKfN'] = true;
      }
      if (inputFieldId == 'kcG670LJt3J' && value != 'Other, specify') {
        hiddenFields['oJVaLuSykXO'] = true;
      }
      if (inputFieldId == 'zjjAVMVuvxe' && value != 'true') {
        hiddenFields['wP7nZkrJIlp'] = true;
        hiddenFields['M0lo7wANrwN'] = true;
        hiddenFields['jxOMACHmXXO'] = true;
      }
      if (inputFieldId == 'hidZMdXFxvR' && value != 'Other') {
        hiddenFields['p82MlDNDGxs'] = true;
      }
      if (inputFieldId == 'RykOGTu3wcd' && value != 'Yes') {
        hiddenFields['iUO02DiUftg'] = true;
      }
      if (inputFieldId == 'kslj60leTJf' && value != 'true') {
        hiddenFields['LjhWZuKCIJu'] = true;
      }
      if (inputFieldId == 't1VRnFuBb7I' && value != 'true') {
        hiddenFields['t1VRnFuBb7I_checkbox'] = true;
        hiddenFields['seiWBkesnnc'] = true;
        hiddenFields['pQ4cUirRxqK'] = true;
        hiddenFields['GI0cqcBMSUV'] = true;
        hiddenFields['MMOeHPgpVj5'] = true;
        hiddenFields['CmJLjd2HxD7'] = true;
        hiddenFields['nLoEbs7cRIu'] = true;
        hiddenFields['LU0OIdYmV7K'] = true;
      }
      if (inputFieldId == 'CmJLjd2HxD7' && value != 'true') {
        hiddenFields['nLoEbs7cRIu'] = true;
        hiddenFields['LU0OIdYmV7K'] = true;
      }
      if (inputFieldId == 'ebeAKSCVsYo' && value != 'false') {
        hiddenFields['XXHMvERCGLn'] = true;
      }
      //Gift starts here
      //This section needs to be worked on when skip logic level 2 is in place
      if (inputFieldId == 'xYdWjIv5eup' && value == 'Primary') {
        hiddenFields['pczeYqyA3Bj'] = true;
        hiddenFields['IUdOAhmhqj1'] = true;
      }
      if (inputFieldId == 'xYdWjIv5eup' && value == 'Secondary') {
        hiddenFields['TRuxsvRahqm'] = true;
        hiddenFields['IUdOAhmhqj1'] = true;
      }
      if (inputFieldId == 'xYdWjIv5eup' && value == 'College') {
        hiddenFields['TRuxsvRahqm'] = true;
        hiddenFields['pczeYqyA3Bj'] = true;
      }
      if (inputFieldId == 'BvEsLzWsL3Z' && value == 'Primary') {
        hiddenFields['pczeYqyA3Bj'] = true;
        hiddenFields['IUdOAhmhqj1'] = true;
      }
      if (inputFieldId == 'BvEsLzWsL3Z' && value == 'Secondary') {
        hiddenFields['TRuxsvRahqm'] = true;
        hiddenFields['IUdOAhmhqj1'] = true;
      }
      if (inputFieldId == 'BvEsLzWsL3Z' && value == 'College') {
        hiddenFields['TRuxsvRahqm'] = true;
        hiddenFields['pczeYqyA3Bj'] = true;
      }
      if (inputFieldId == 'M3AaNTqC9d6' && value == 'Primary') {
        hiddenFields['dwJns2uXUcG'] = true;
        hiddenFields['SGCjKsX1Mzl'] = true;
      }
      if (inputFieldId == 'M3AaNTqC9d6' && value == 'Secondary/High level') {
        hiddenFields['dwJns2uXUcG'] = true;
        hiddenFields['xbAukRUBixJ'] = true;
      }
      if (inputFieldId == 'M3AaNTqC9d6' && value == 'College') {
        hiddenFields['xbAukRUBixJ'] = true;
        hiddenFields['SGCjKsX1Mzl'] = true;
      }
      if (inputFieldId == 'KlbW2l1L1NC' && value == 'Primary') {
        hiddenFields['dwJns2uXUcG'] = true;
        hiddenFields['SGCjKsX1Mzl'] = true;
      }
      if (inputFieldId == 'KlbW2l1L1NC' && value == 'Secondary/High level') {
        hiddenFields['dwJns2uXUcG'] = true;
        hiddenFields['xbAukRUBixJ'] = true;
      }
      if (inputFieldId == 'KlbW2l1L1NC' && value == 'College') {
        hiddenFields['xbAukRUBixJ'] = true;
        hiddenFields['SGCjKsX1Mzl'] = true;
      }
      //================================================================

      //Domain Stable
      if (inputFieldId == 'aaERjQ9jSZn' && value != 'true') {
        hiddenFields['cGJa4gfVPQ7'] = true;
      }
      if (inputFieldId == 'MEmFZrOhvb3' && value != 'true') {
        hiddenFields['cGJa4gfVPQ7'] = true;
      }

      if (inputFieldId == 'dTiDozleQuO' && value != 'Yes') {
        hiddenFields['dTiDozleQuO_checkbox'] = true;
      }

      //Domain Health
      if(inputFieldId == 'pU5ywj3cjSA' && value != 'true'){
        hiddenFields['HXk5d3kxy37'] = true;
      }
      if(inputFieldId == 'HXk5d3kxy37' && value != 'true'){
        hiddenFields['ndK4JCMORL0'] = true;
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
