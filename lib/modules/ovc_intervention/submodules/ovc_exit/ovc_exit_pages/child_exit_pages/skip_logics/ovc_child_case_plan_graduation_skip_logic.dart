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

    var age = int.parse("${dataObject['age']}");
    var hivStatus = dataObject['hivStatus'];

    // Hidden sections by age
    if (age > 17 || age < 10) {
      hiddenSections['A5NBGrJWy1z'] = true;
    }
    if (age < 0 || age > 4) {
      hiddenSections['ceYTaM00pTh'] = true;
      hiddenSections['P90kJechZJT'] = true;
    }

    // Hidden sections by HIV status
    if (hivStatus != 'Positive') {
      hiddenSections['R4OiU8dHKDe'] = true;
    }

    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';

      if (inputFieldId == '') {}

      // Benchmarks skip logics
      // for Benchmark 1
      if (inputFieldId == 'wE7and4EnCR') {
        bool isBenchmarkMet = '${dataObject["WFjzAp3wQ8M"]}' == 'true' &&
            '${dataObject["aoGIcQaTXjh"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      }
      // Benchmark 2
      else if (inputFieldId == 'R71zksHtVNn') {
        bool isBenchmarkMet = '${dataObject["naaNy5zLz3I"]}' == 'true' ||
            ('${dataObject["FOimOq843Ly"]}' == 'true' &&
                '${dataObject["q8HfJgKMqrM"]}' == 'true');
        assignInputFieldValue(context, inputFieldId, '$isBenchmarkMet');
      }
      // for Benchmark 3
      else if (inputFieldId == 'rPSpAEnnVS4') {
        // TODO needs closer look
        bool isBenchmarkMet = '${dataObject["hxLZDtNtn3p"]}' == 'true' &&
            '${dataObject["ApextZUIUcC"]}' == 'true';
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
      } else if (inputFieldId == 'YsPKdNobVFD') {
        bool areAllBenchmarksMet = '${dataObject["wE7and4EnCR"]}' == 'true' &&
            '${dataObject["R71zksHtVNn"]}' == 'true' &&
            '${dataObject["rPSpAEnnVS4"]}' == 'true' &&
            '${dataObject["XxioqueCXcn"]}' == 'true' &&
            '${dataObject["OcbE9kN8Dcp"]}' == 'true' &&
            '${dataObject["S5bMqu2LyKJ"]}' == 'true';
        assignInputFieldValue(context, inputFieldId, '$areAllBenchmarksMet');
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
