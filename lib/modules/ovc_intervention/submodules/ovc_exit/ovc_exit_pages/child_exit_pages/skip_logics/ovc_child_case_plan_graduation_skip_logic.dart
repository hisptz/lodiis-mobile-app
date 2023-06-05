import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class OvcChildCasePlanGraduationSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};

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
      // for Benchmark 1
      if (inputFieldId == 'wE7and4EnCR') {
        bool isBenchmarkMet = '${dataObject["WFjzAp3wQ8M"]}' == 'true' &&
            '${dataObject["aoGIcQaTXjh"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      }
      // Benchmark 2
      else if (inputFieldId == 'R71zksHtVNn') {
        bool isBenchmarkMet = '${dataObject["WFjzAp3wQ8M"]}' == 'true' ||
            ('${dataObject["FOimOq843Ly"]}' == 'true' &&
                '${dataObject["q8HfJgKMqrM"]}' == 'true');
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      }
      // for Benchmark 3
      else if (inputFieldId == 'rPSpAEnnVS4') {
        // TODO needs closer look
        bool isBenchmarkMet = '${dataObject["ApextZUIUcC"]}' == 'true' &&
            '${dataObject["hxLZDtNtn3p"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      }
      // for Benchmark 4
      else if (inputFieldId == 'XxioqueCXcn') {
        bool isBenchmarkMet = '${dataObject["htotfutRcVF"]}' == 'true' &&
            '${dataObject["F7HWBfHN6tQ"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      } // for Benchmark 5
      else if (inputFieldId == 'OcbE9kN8Dcp') {
        bool isBenchmarkMet = ('${dataObject["zPggDcmT4zt"]}' == 'true' &&
                '${dataObject["UxPgBn3JRBQ"]}' == 'true') ||
            ('${dataObject["fffETOzhGsU"]}' == 'true' &&
                '${dataObject["wGeVdyVO5hE"]}' == 'Negative');
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      } // for Benchmark 6
      else if (inputFieldId == 'YdqDLYSE4qr') {
        bool isBenchmarkMet = '${dataObject["PkvK39frchD"]}' == 'true' &&
            '${dataObject["RVGFbzbEGmY"]}' == 'true' &&
            '${dataObject["HzUAxTw1nZs"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
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
    String? value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
      inputFieldId,
      value,
      isChangesBasedOnSkipLogic: true,
    );
  }
}
