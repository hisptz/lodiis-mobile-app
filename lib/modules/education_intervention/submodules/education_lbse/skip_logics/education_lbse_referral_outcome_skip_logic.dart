import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralOutcomeSkipLogic {
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

    hiddenFields['lvT9gfpHIlT'] = true;
    hiddenFields['Ep3atnNQGTY'] = true;
    hiddenFields['DPf5mUDoZMy'] = true;
    hiddenFields['LcG4J82PM4Z'] = true;
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'hXyqgOWZ17b' && value == 'true') {
        hiddenFields['lvT9gfpHIlT'] = false;
        hiddenFields['Ep3atnNQGTY'] = false;
        hiddenFields['LcG4J82PM4Z'] = false;
      } else if (inputFieldId == 'hXyqgOWZ17b' && value == 'false') {
        hiddenFields['LcG4J82PM4Z'] = false;
      } else if (inputFieldId == 'Ep3atnNQGTY' && value == 'true') {
        hiddenFields['DPf5mUDoZMy'] = false;
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
    resetValuesForHiddenOptions(context);
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

  static resetValuesForHiddenOptions(
    BuildContext context,
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
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
      inputFieldId,
      value,
      isChangesBasedOnSkipLogic: true,
    );
  }
}
