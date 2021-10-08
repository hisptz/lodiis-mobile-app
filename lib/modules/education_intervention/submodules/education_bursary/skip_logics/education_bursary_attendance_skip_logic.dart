import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class EducationBursaryAttendanceSKipLogic {
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
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }

    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'WvYI4dliZyk') {
        if (value != 'false') {
          hiddenFields['hpuu3TCZkKx'] = true;
          hiddenFields['KzIw7RMGZ9c'] = true;
          hiddenFields['EokvDGvXkOk'] = true;
          hiddenFields['OIUDljKyNgy'] = true;
        } else {
          hiddenFields['GKBZYfIj2s1'] = true;
        }
      }

      // for referred services
      if (inputFieldId == 'EokvDGvXkOk') {
        Map hiddenOptions = Map();
        if (value == 'self health ' ||
            value == 'Caregiver health' ||
            value == 'sibling health') {
          hiddenOptions['Legal service'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
          hiddenOptions['Social Assistance services'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
        } else if (value == 'cultural') {
          hiddenOptions['health services'] = true;
          hiddenOptions['Legal service'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
          hiddenOptions['Social Assistance services'] = true;
        } else if (value == 'sexual violence' || value == 'Physical violence') {
          hiddenOptions['Social Assistance services'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
        } else if (value == 'emotional violence' ||
            value == 'CB' ||
            value == 'VB' ||
            value == 'school sexual harrassment') {
          hiddenOptions['health services'] = true;
          hiddenOptions['Social Assistance services'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
        } else if (value == 'economic vilence' || value == 'neglect') {
          hiddenOptions['health services'] = true;
          hiddenOptions['Social Assistance services'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
        } else if (value == 'lost interest' || value == 'weather conditions') {
          hiddenOptions['Social Assistance services'] = true;
          hiddenOptions['health services'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
          hiddenOptions['Legal service'] = true;
          hiddenOptions['LICPEH'] = true;
        } else if (value == 'PB') {
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
          hiddenOptions['Social Assistance services'] = true;
        } else if (value == 'SC' || value == 'Stationary') {
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
          hiddenOptions['Legal service'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
          hiddenOptions['Psycho social'] = true;
          hiddenOptions['health services'] = true;
        } else if (value == 'Levy') {
          hiddenOptions['LICPEH'] = true;
          hiddenOptions['Safety and sercurity (police)'] = true;
          hiddenOptions['Legal service'] = true;
          hiddenOptions['Social clubs in the community'] = true;
          hiddenOptions['MGYSR Youth centres'] = true;
          hiddenOptions['Psycho social'] = true;
          hiddenOptions['health services'] = true;
        }

        hiddenInputFieldOptions['KzIw7RMGZ9c'] = hiddenOptions;
      }

      // for referred organisation
      if (inputFieldId == 'hpuu3TCZkKx') {
        String reason = '${dataObject['EokvDGvXkOk']}';
        String referral = '${dataObject['KzIw7RMGZ9c']}';
        Map hiddenOptions = Map();
        if (referral == 'health services') {
          hiddenOptions['WLSA'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'Legal service') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'Safety and sercurity (police)') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['WLSA'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'Psycho social') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['WLSA'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'Social Assistance services') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['WLSA'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'LICPEH') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MGYSR'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'Social clubs in the community') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['WLSA'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        } else if (referral == 'MGYSR Youth centres"') {
          hiddenOptions['Health faccility'] = true;
          hiddenOptions['WLSA'] = true;
          hiddenOptions['Police'] = true;
          hiddenOptions['MOSD'] = true;
          hiddenOptions['KB'] = true;
          hiddenOptions['EGPAF'] = true;
        }

        hiddenInputFieldOptions['hpuu3TCZkKx'] = hiddenOptions;
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
