import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class DreamsAgywReferralSkipLogic {
  static Map hiddenFields = {};
  static Map hiddenSections = {};
  static Map hiddenInputFieldOptions = {};

  static Future evaluateSkipLogics(
      BuildContext context,
      List<FormSection> formSections,
      Map dataObject,
      String currentImplementingPartner,
      Map<String, dynamic> referralServicesByImplementingPartners) async {
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();

    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }

    // Age based skip logics
    Map referralServiceHiddenByAge = {};
    int agywDreamAge = int.parse(dataObject['age'] ?? '0');
    if (agywDreamAge < 10 || agywDreamAge > 24) {
      referralServiceHiddenByAge['LBSE'] = true;
      referralServiceHiddenByAge['FinancialLiteracyEducation'] = true;
      referralServiceHiddenByAge['ViolencePreventionEducation'] = true;
      referralServiceHiddenByAge['PostGBVCareLegal'] = true;
      referralServiceHiddenByAge['HIVPreventionEducation'] = true;
      referralServiceHiddenByAge['ARTInitiation'] = true;
      referralServiceHiddenByAge['PostGBVServicesClinical'] = true;
      referralServiceHiddenByAge['Treatment Support (TB/ARV)'] = true;
      referralServiceHiddenByAge['EMTCT'] = true;
      referralServiceHiddenByAge['ANC'] = true;
      referralServiceHiddenByAge['TB screening'] = true;
      referralServiceHiddenByAge['HTS'] = true;
      referralServiceHiddenByAge['FamilyPlanningSRH'] = true;
      referralServiceHiddenByAge['STI Screening'] = true;
      referralServiceHiddenByAge['STI Treatment'] = true;
      referralServiceHiddenByAge['HIVRiskAssessment'] = true;
    }
    if (agywDreamAge < 15 || agywDreamAge > 24) {
      referralServiceHiddenByAge['PEP'] = true;
      referralServiceHiddenByAge['PrEP'] = true;
      referralServiceHiddenByAge['CondomEducationProvision'] = true;
      referralServiceHiddenByAge['Cervical Cancer Screening'] = true;
    }
    if (agywDreamAge < 18 || agywDreamAge > 24) {
      referralServiceHiddenByAge['Go Girls'] = true;
      referralServiceHiddenByAge['ComprehensiveEconomicStrengthening'] = true;
      referralServiceHiddenByAge['SILC'] = true;
    }
    if (agywDreamAge < 10 || agywDreamAge > 17) {
      referralServiceHiddenByAge['Parenting'] = true;
      referralServiceHiddenByAge['Aflateen/toun'] = true;
      referralServiceHiddenByAge['SAVING GROUPS'] = true;
    }
    if (agywDreamAge < 13 || agywDreamAge > 18) {
      referralServiceHiddenByAge['EducationSubsidiesSupport'] = true;
    }

    String implementingPartnerValue = "${dataObject['y0bvausyTyh'] ?? ''}";
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'qAed23reDPP') {
        if (implementingPartnerValue == 'null' ||
            implementingPartnerValue == '') {
          hiddenSections['SeRefoCo'] = true;
          hiddenSections['SeRefoFa'] = true;
        } else {
          if (value == 'Community') {
            hiddenSections['SeRefoFa'] = true;
          } else if (value == 'Facility') {
            hiddenSections['SeRefoCo'] = true;
          } else {
            hiddenSections['SeRefoFa'] = true;
            hiddenSections['SeRefoCo'] = true;
          }
        }
      }
      if (inputFieldId == 'y0bvausyTyh') {
        Map implementingPartnerHiddenOptions = {};
        String referralLevel = dataObject['qAed23reDPP'];
        if (referralLevel == 'Community') {
          implementingPartnerHiddenOptions['EGPAF'] = true;
          implementingPartnerHiddenOptions['M2M'] = true;
        } else if (referralLevel == 'Facility') {
          implementingPartnerHiddenOptions['JHPIEGO'] = true;
          implementingPartnerHiddenOptions['KB-AGYW/DREAMS'] = true;
          implementingPartnerHiddenOptions['CoHIP SEC'] = true;
        }
        implementingPartnerHiddenOptions[currentImplementingPartner] = true;
        hiddenInputFieldOptions[inputFieldId] =
            implementingPartnerHiddenOptions;
      }
      if ((inputFieldId == 'LLWTHwhnch0' || inputFieldId == 'AuCryxQYmrk') &&
          value != 'null') {
        Map referralServiceHiddenOptions = {};
        if (value == 'Clinical Services') {
          referralServiceHiddenOptions['PostGBVCareLegal'] = true;
          referralServiceHiddenOptions['Aflateen/toun'] = true;
          referralServiceHiddenOptions['Go Girls'] = true;
          referralServiceHiddenOptions['FinancialLiteracyEducation'] = true;
          referralServiceHiddenOptions['SAVING GROUPS'] = true;
          referralServiceHiddenOptions['Parenting'] = true;
          referralServiceHiddenOptions['SILC'] = true;
          referralServiceHiddenOptions['LBSE'] = true;
          referralServiceHiddenOptions['ViolencePreventionEducation'] = true;
          referralServiceHiddenOptions['ComprehensiveEconomicStrengthening'] =
              true;
          referralServiceHiddenOptions['EducationSubsidiesSupport'] = true;
        } else if (value == 'GenderBasedViolence') {
          referralServiceHiddenOptions['Aflateen/toun'] = true;
          referralServiceHiddenOptions['Go Girls'] = true;
          referralServiceHiddenOptions['FinancialLiteracyEducation'] = true;
          referralServiceHiddenOptions['SAVING GROUPS'] = true;
          referralServiceHiddenOptions['Parenting'] = true;
          referralServiceHiddenOptions['SILC'] = true;
          referralServiceHiddenOptions['LBSE'] = true;
          referralServiceHiddenOptions['HIVRiskAssessment'] = true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIVPreventionEducation'] = true;
          referralServiceHiddenOptions['ARTInitiation'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['CondomEducationProvision'] = true;
          referralServiceHiddenOptions['PEP'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          referralServiceHiddenOptions['PrEP'] = true;
          referralServiceHiddenOptions['EMTCT'] = true;
          referralServiceHiddenOptions['ParentingPregBreastfeeding'] = true;
          referralServiceHiddenOptions['ComprehensiveEconomicStrengthening'] =
              true;
          referralServiceHiddenOptions['EducationSubsidiesSupport'] = true;
          referralServiceHiddenOptions['PostGBVServicesClinical'] = true;
          referralServiceHiddenOptions['Treatment Support (TB/ARV)'] = true;
        } else if (value == 'LifeSkillSocialAssetServices') {
          referralServiceHiddenByAge['ParentingPregBreastfeeding'] = true;
          referralServiceHiddenOptions['ViolencePreventionEducation'] = true;
          referralServiceHiddenOptions['HIVRiskAssessment'] = true;
          referralServiceHiddenOptions['PostGBVCareLegal'] = true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIVPreventionEducation'] = true;
          referralServiceHiddenOptions['ARTInitiation'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['CondomEducationProvision'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          referralServiceHiddenOptions['PEP'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          referralServiceHiddenOptions['SILC'] = true;
          referralServiceHiddenOptions['PrEP'] = true;
          referralServiceHiddenOptions['EMTCT'] = true;
          referralServiceHiddenOptions['ComprehensiveEconomicStrengthening'] =
              true;
          referralServiceHiddenOptions['Treatment Support (TB/ARV)'] = true;
          referralServiceHiddenOptions['PostGBVServicesClinical'] = true;
          referralServiceHiddenOptions['FinancialLiteracyEducation'] = true;
          referralServiceHiddenOptions['SAVING GROUPS'] = true;
        } else if (value == 'EconomicStrengtheningActivities') {
          referralServiceHiddenOptions['ParentingPregBreastfeeding'] = true;
          referralServiceHiddenOptions['LBSE'] = true;
          referralServiceHiddenOptions['ViolencePreventionEducation'] = true;
          referralServiceHiddenOptions['PostGBVCareLegal'] = true;
          referralServiceHiddenOptions['HIVPreventionEducation'] = true;
          referralServiceHiddenOptions['ARTInitiation'] = true;
          referralServiceHiddenOptions['PostGBVServicesClinical'] = true;
          referralServiceHiddenOptions['Treatment Support (TB/ARV)'] = true;
          referralServiceHiddenOptions['EMTCT'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIVRiskAssessment'] = true;
          referralServiceHiddenOptions['PEP'] = true;
          referralServiceHiddenOptions['PrEP'] = true;
          referralServiceHiddenOptions['CondomEducationProvision'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          referralServiceHiddenOptions['Go Girls'] = true;
          referralServiceHiddenOptions['Parenting'] = true;
          referralServiceHiddenOptions['Aflateen/toun'] = true;
          referralServiceHiddenOptions['EducationSubsidiesSupport'] = true;
        }
        Map hiddenReferralServicesByImplementingPartner =
            getAllImplementingPartnerHiddenServices(
                referralServicesByImplementingPartners,
                implementingPartnerValue);
        referralServiceHiddenOptions
            .addAll(hiddenReferralServicesByImplementingPartner);
        String referralServiceField = inputFieldId == 'LLWTHwhnch0'
            ? 'rsh5Kvx6qAU'
            : inputFieldId == 'AuCryxQYmrk'
                ? 'OrC9Bh2bcFz'
                : 'none';
        hiddenInputFieldOptions[referralServiceField] = {
          ...referralServiceHiddenOptions,
          ...referralServiceHiddenByAge
        };
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
      String implementingPartnerValue) {
    List<String> referralServices =
        getAllReferralServices(referralServicesByImplementingPartners);
    List<String> allImplementingPartnerReferralServices =
        getReferralServicesByIP(
            data: referralServicesByImplementingPartners,
            ip: implementingPartnerValue);
    Map hiddenReferralServices = {};
    for (var service in referralServices) {
      {
        if (!allImplementingPartnerReferralServices.contains(service)) {
          hiddenReferralServices[service] = true;
        }
      }
    }

    return hiddenReferralServices;
  }

  static List<String> getAllReferralServices(Map<String, dynamic> data) {
    return (data.values)
        .expand((item) => item)
        .toList()
        .map(((item) => item as String))
        .toList();
  }

  static List<String> getReferralServicesByIP(
      {Map<String, dynamic> data = const {}, String ip = ''}) {
    List services = (data[ip] as List?) ?? [];
    return services.map((item) => item as String).toList();
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

  static resetValuesForHiddenInputFieldOptions(BuildContext context) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenInputFieldOptions(hiddenInputFieldOptions);
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
