import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class OvchouseHoldAssessmentSkipLogic {
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
      if (inputFieldId == 'PiXi6AtLqiQ' && value != 'true') {
        hiddenFields['zUU33n41Soa'] = true;
      }
      if (inputFieldId == 'yqwX3XCGAUN' && value != 'true') {
        hiddenFields['BKDRNiyoMgV'] = true;
      }

      if (inputFieldId == 'p8htbyJHydl' && value != 'true') {
        hiddenFields['p8htbyJHydl_checkbox'] = true;
        hiddenFields['kFRCZNQIF51'] = true;
        hiddenFields['Pe3CHmZicqT'] = true;
        hiddenFields['DgzwMbXo0ZK'] = true;
        hiddenFields['GC6eZ5TOt9z'] = true;
        hiddenFields['bKkHP4C1WzO'] = true;
        hiddenFields['roCpGtUYOhp'] = true;
        hiddenFields['mXBvp9ahws3'] = true;
        hiddenFields['jtCijspeacL'] = true;
      }
      if (inputFieldId == 'jtCijspeacL' && value != 'true') {
        hiddenFields['Vur0hsmfhQ5'] = true;
      }
      if (inputFieldId == 'W3N2e2SaBCp' && value != 'true') {
        hiddenFields['jvbE4vFHjA6'] = true;
      }
      if (inputFieldId == 'ut8LqpHyZnR' && value != 'true') {
        hiddenFields['ut8LqpHyZnR_checkbox'] = true;
        hiddenFields['TeVmOZEH9ww'] = true;
        hiddenFields['WYUkGeSWaZY'] = true;
        hiddenFields['KA3l4V5NDWu'] = true;
        hiddenFields['NpxDYjUFlKS'] = true;
        hiddenFields['sftyaTdwBKz'] = true;
        hiddenFields['bEXtDfYHP4B'] = true;
        hiddenFields['KexFaUmJpt5'] = true;
        hiddenFields['gcW6652C8Bt'] = true;
        hiddenFields['AccHyrWqhI0'] = true;
      }
      if (inputFieldId == 'gcW6652C8Bt' && value != 'true') {
        hiddenFields['bmJjZctbkhX'] = true;
      }
      if (inputFieldId == 'AccHyrWqhI0' && value != '1') {
        hiddenFields['w6xeZ47TwwI'] = true;
      }
      if (inputFieldId == 'BvNaiaoxc6w' && value != 'true') {
        hiddenFields['Uv26fX0HQvO'] = true;
        hiddenFields['T4grVrCVDkk'] = true;
      }
      if (inputFieldId == 'blod3xZ2dPP' && value != '1') {
        hiddenFields['ubin7MjQ5OI'] = true;
      }
      if (inputFieldId == 'Icb6vUJXVDX' && value != 'Other') {
        hiddenFields['IiKxc53TdqL'] = true;
      }
      if (inputFieldId == 'HLPSkYfLYlS' && value != 'true') {
        hiddenFields['I3hI2UTkKyx'] = true;
      }
      if (inputFieldId == 'loGTnsw9R9G' && value != 'true') {
        hiddenFields['dfdeOt1y7me'] = true;
      }
      if (inputFieldId == 'X094f7yANdc' && value != 'true') {
        hiddenFields['J8gzZEMnQLX'] = true;
        hiddenFields['uznwDGvHcie'] = true;
      }
      if (inputFieldId == 'ajrDVp6cI2k' && value != 'true') {
        hiddenFields['hiRnasaeK9H'] = true;
      }
      if (inputFieldId == 'RxvDeJX3b3k' && value != 'true') {
        hiddenFields['E4UFvIBBEDk'] = true;
        hiddenFields['RWcOcPqBnFj'] = true;
        hiddenFields['zWpm4lCpRxbR'] = true;
      }
      if (inputFieldId == 'E4UFvIBBEDk' && value != 'Others') {
        hiddenFields['RWcOcPqBnFj'] = true;
      }

      if (inputFieldId == 'T4grVrCVDkk' && value != 'true') {
        hiddenFields['vNeOE9abQBB'] = true;
      }

      if (inputFieldId == 'vNeOE9abQBB' && value != 'Positive') {
        hiddenFields['blod3xZ2dPP'] = true;
        hiddenFields['ubin7MjQ5OI'] = true;
        hiddenFields['Icb6vUJXVDX'] = true;
      }

      if (inputFieldId == 'sLyfb45aLkl' && value != '1') {
        hiddenFields['aRNGDZcwWmS'] = true;
      }
      if(inputFieldId =='BYZu8p33lzP' && value !='Yes'){
        hiddenFields['ToWhhydys'] = true;
      }
      if(inputFieldId == 'SLajij5j1KI' && value != 'Yes'){
        hiddenFields['RxvDeJX3b3k'] = true;
      }

      if(inputFieldId == 'doJJzw4NX8m' && value == 'true'){
        hiddenFields['doJJzw4NX8m_checkbox'] = true;
      }
      if(inputFieldId == 'LGrG9fGZfXP' && value == 'true'){
          hiddenFields['ZuaV20IvVV2'] = true;
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
