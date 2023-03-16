import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class PpPrevReferralFormSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

  static Future evaluateSkipLogics(
      BuildContext context,
      List<FormSection> formSections,
      Map dataObject,
      Map<String, dynamic> implementingPartnerReferralServices) async {
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
      if (inputFieldId == 'IEdBgx4vn1J' && value.isNotEmpty) {
        var hiddenImplementingPartners =
            getAllImplementingPartnerHiddenServices(
                implementingPartnerReferralServices, value);
        hiddenInputFieldOptions['h4PRnqfEOCL'] = hiddenImplementingPartners;
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

  static Map getAllImplementingPartnerHiddenServices(
      Map<String, dynamic> referralServicesByImplementingPartners,
      String service) {
    List<String> partnersToHide = [];
    referralServicesByImplementingPartners
        .forEach((implementingPartner, services) {
      if (!(services).contains(service)) {
        partnersToHide.add(implementingPartner);
      }
    });
    Map hiddenReferralServices = {};
    for (var service in partnersToHide) {
      hiddenReferralServices[service] = true;
    }
    return hiddenReferralServices;
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

  static resetValuesForHiddenInputFieldOptions(BuildContext context) {
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
