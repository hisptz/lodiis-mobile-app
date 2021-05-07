import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class DreamAgywReferralSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();
  static Map hiddenInputFieldOptions = Map();

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
    String implementingPartnerValue = "${dataObject['y0bvausyTyh'] ?? ''}";
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      if (inputFieldId == 'qAed23reDPP') {
        if ("$implementingPartnerValue" == 'null' ||
            "$implementingPartnerValue" == '') {
          hiddenSections['SeRefoCo'] = true;
          hiddenSections['SeRefoFa'] = true;
        } else {
          if (value != 'Community') {
            hiddenSections['SeRefoCo'] = true;
          } else if (value != 'Facility') {
            hiddenSections['SeRefoFa'] = true;
          }
        }
      }
      if (inputFieldId == 'y0bvausyTyh') {
        Map implementingPartnerHiddenOptions = Map();
        implementingPartnerHiddenOptions[currentImplementingPartner] = true;
        hiddenInputFieldOptions[inputFieldId] =
            implementingPartnerHiddenOptions;
      }
      if (inputFieldId == 'LLWTHwhnch0' && value != 'null') {
        Map referralServiceHiddenOptions = Map();
        if (value == 'Clinical Services') {
          referralServiceHiddenOptions['Youth friendly services'] = true;
          referralServiceHiddenOptions['Gender Based Violence'] = true;
          referralServiceHiddenOptions['Domestic Violence Support group'] =
              true;
          referralServiceHiddenOptions['Income generating activity'] = true;
          referralServiceHiddenOptions['Orphan Care & Support'] = true;
          referralServiceHiddenOptions['Psycho-social Support'] = true;
          referralServiceHiddenOptions['PLHIV support group'] = true;
          referralServiceHiddenOptions['Referral to post abuse care services'] =
              true;
          // rreferralServiceHiddenOptions['Violence Against Children'] = true;
          // referralServiceHiddenOptions['CAG'] = true;
          // referralServiceHiddenOptions['Home based care visits'] = true;
          referralServiceHiddenOptions['Educational and vocational support'] =
              true;
          referralServiceHiddenOptions['Social grants'] = true;
        } else if (value == 'Post abuse case management') {
          referralServiceHiddenOptions['Youth friendly services'] = true;
          referralServiceHiddenOptions['Income generating activity'] = true;
          referralServiceHiddenOptions['Orphan Care & Support'] = true;
          referralServiceHiddenOptions['Psycho-social Support'] = true;
          referralServiceHiddenOptions['PLHIV support group'] = true;
          // referralServiceHiddenOptions['CAG'] = true;
          // referralServiceHiddenOptions['Home based care visits'] = true;
          referralServiceHiddenOptions['Educational and vocational support'] =
              true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIV Testing and counselling'] = true;
          referralServiceHiddenOptions['Evaluation for ARVs/HAART'] = true;
          referralServiceHiddenOptions['ART and Adherence'] = true;
          // referralServiceHiddenOptions['PMTCT Services'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['Condom supply'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['TB treatment'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          // referralServiceHiddenOptions['VMMC'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          // referralServiceHiddenOptions['ECD'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          // referralServiceHiddenOptions['EID Testing'] = true;
          referralServiceHiddenOptions['PrEP/PEP'] = true;
          referralServiceHiddenOptions['PMTCT'] = true;
          referralServiceHiddenOptions['Social grants'] = true;
        } else if (value == 'Social Services') {
          referralServiceHiddenOptions['Referral to post abuse care services'] =
              true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIV Testing and counselling'] = true;
          referralServiceHiddenOptions['Evaluation for ARVs/HAART'] = true;
          referralServiceHiddenOptions['ART and Adherence'] = true;
          // referralServiceHiddenOptions['PMTCT Services'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['Condom supply'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['TB treatment'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          // referralServiceHiddenOptions['VMMC'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          // referralServiceHiddenOptions['ECD'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          // referralServiceHiddenOptions['EID Testing'] = true;
          referralServiceHiddenOptions['PrEP/PEP'] = true;
          referralServiceHiddenOptions['PMTCT'] = true;
          referralServiceHiddenOptions['Gender Based Violence'] = true;
          referralServiceHiddenOptions['Domestic Violence Support group'] =
              true;
          // rreferralServiceHiddenOptions['Violence Against Children'] = true;
        }
        Map hiddenReferralServicesByImplemetingPartner =
            getAllImplemetingPartnerHiddenServices(
                referralServicesByImplementingPartners,
                implementingPartnerValue);
        referralServiceHiddenOptions
            .addAll(hiddenReferralServicesByImplemetingPartner);
        hiddenInputFieldOptions['rsh5Kvx6qAU'] = referralServiceHiddenOptions;
      }
      if (inputFieldId == 'AuCryxQYmrk' && value != 'null') {
        Map referralServiceHiddenOptions = Map();
        if (value == 'Clinical Services') {
          referralServiceHiddenOptions['Youth friendly services'] = true;
          referralServiceHiddenOptions['Gender Based Violence'] = true;
          referralServiceHiddenOptions['Domestic Violence Support group'] =
              true;
          referralServiceHiddenOptions['Income generating activity'] = true;
          referralServiceHiddenOptions['Orphan Care & Support'] = true;
          referralServiceHiddenOptions['Psycho-social Support'] = true;
          referralServiceHiddenOptions['PLHIV support group'] = true;
          referralServiceHiddenOptions['Referral to post abuse care services'] =
              true;
          // rreferralServiceHiddenOptions['Violence Against Children'] = true;
          // referralServiceHiddenOptions['CAG'] = true;
          // referralServiceHiddenOptions['Home based care visits'] = true;
          referralServiceHiddenOptions['Educational and vocational support'] =
              true;
          referralServiceHiddenOptions['Social grants'] = true;
        } else if (value == 'Post abuse case management') {
          referralServiceHiddenOptions['Youth friendly services'] = true;
          referralServiceHiddenOptions['Income generating activity'] = true;
          referralServiceHiddenOptions['Orphan Care & Support'] = true;
          referralServiceHiddenOptions['Psycho-social Support'] = true;
          referralServiceHiddenOptions['PLHIV support group'] = true;
          // referralServiceHiddenOptions['CAG'] = true;
          // referralServiceHiddenOptions['Home based care visits'] = true;
          referralServiceHiddenOptions['Educational and vocational support'] =
              true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIV Testing and counselling'] = true;
          referralServiceHiddenOptions['Evaluation for ARVs/HAART'] = true;
          referralServiceHiddenOptions['ART and Adherence'] = true;
          // referralServiceHiddenOptions['PMTCT Services'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['Condom supply'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['TB treatment'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          // referralServiceHiddenOptions['VMMC'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          // referralServiceHiddenOptions['ECD'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          // referralServiceHiddenOptions['EID Testing'] = true;
          referralServiceHiddenOptions['PrEP/PEP'] = true;
          referralServiceHiddenOptions['PMTCT'] = true;
          referralServiceHiddenOptions['Social grants'] = true;
        } else if (value == 'Social Services') {
          referralServiceHiddenOptions['Referral to post abuse care services'] =
              true;
          referralServiceHiddenOptions['STI Screening'] = true;
          referralServiceHiddenOptions['STI Treatment'] = true;
          referralServiceHiddenOptions['HIV Testing and counselling'] = true;
          referralServiceHiddenOptions['Evaluation for ARVs/HAART'] = true;
          referralServiceHiddenOptions['ART and Adherence'] = true;
          // referralServiceHiddenOptions['PMTCT Services'] = true;
          referralServiceHiddenOptions['FamilyPlanningSRH'] = true;
          referralServiceHiddenOptions['Condom supply'] = true;
          referralServiceHiddenOptions['TB screening'] = true;
          referralServiceHiddenOptions['TB treatment'] = true;
          referralServiceHiddenOptions['Nutrition'] = true;
          // referralServiceHiddenOptions['VMMC'] = true;
          referralServiceHiddenOptions['Cervical Cancer Screening'] = true;
          // referralServiceHiddenOptions['ECD'] = true;
          referralServiceHiddenOptions['HTS'] = true;
          referralServiceHiddenOptions['ANC'] = true;
          // referralServiceHiddenOptions['EID Testing'] = true;
          referralServiceHiddenOptions['PrEP/PEP'] = true;
          referralServiceHiddenOptions['PMTCT'] = true;
          referralServiceHiddenOptions['Gender Based Violence'] = true;
          referralServiceHiddenOptions['Domestic Violence Support group'] =
              true;
          // rreferralServiceHiddenOptions['Violence Against Children'] = true;
        }
        Map hiddenReferralServicesByImplemetingPartner =
            getAllImplemetingPartnerHiddenServices(
                referralServicesByImplementingPartners,
                implementingPartnerValue);
        referralServiceHiddenOptions
            .addAll(hiddenReferralServicesByImplemetingPartner);
        hiddenInputFieldOptions['OrC9Bh2bcFz'] = referralServiceHiddenOptions;
      }
    }
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hidddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hidddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenInputFieldOptions(context);
    resetValuesForHiddenSections(context, formSections);
  }

  static Map getAllImplemetingPartnerHiddenServices(
      Map<String, dynamic> referralServicesByImplementingPartners,
      String implementingPartnerValue) {
    List<String> referralServices =
        getAllReferralServices(referralServicesByImplementingPartners);
    List<String> allImplementingPartnerReferralServices =
        getReferralServicesByIP(
            data: referralServicesByImplementingPartners,
            ip: implementingPartnerValue);
    Map hiddedReferralServices = Map();
    referralServices.forEach((service) => {
          if (allImplementingPartnerReferralServices.indexOf(service) == -1)
            {hiddedReferralServices[service] = true}
        });

    return hiddedReferralServices;
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
    List services = (data[ip] as List) ?? [];
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
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
