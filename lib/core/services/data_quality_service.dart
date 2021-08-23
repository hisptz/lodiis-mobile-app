import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/none_agyw_enrollment_prep_screening.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/models/ogac_enrollment_form_section.dart';

class DataQualityService {
  static String getSanitizedNumericalValue(String value) {
    value = value.trim() == '' ? '0' : value;
    return !value.contains('.')
        ? '${int.parse(value)}'
        : '${double.parse(value)}';
  }

  static void runDataQualityCheckResolution() async {
    List resolvedAttributes = [];
    List<FormSection> enrollmentFormSections = getEnrollmmentFormSections();
    List<InputField> numericalInputFields =
        getNumericalInputFields(enrollmentFormSections);
    List<String> attributeIds = numericalInputFields
        .map((InputField inputField) => inputField.id)
        .toList()
        .toSet()
        .toList();
    // @TODO filtering list with those who fail to sync
    List attributes = await TrackedEntityInstanceOfflineAttributeProvider()
        .getTrackedEntityAttributesValuesById(attributeIds);
    for (Map attributeObject in attributes) {
      Map resolvedAttribute = Map<String, dynamic>();
      resolvedAttribute["id"] = attributeObject["id"];
      resolvedAttribute["trackedEntityInstance"] =
          attributeObject["trackedEntityInstance"];
      resolvedAttribute["attribute"] = attributeObject["attribute"];
      resolvedAttribute["value"] =
          getSanitizedNumericalValue(attributeObject["value"]);
      resolvedAttributes.add(resolvedAttribute);
    }
    await TrackedEntityInstanceOfflineAttributeProvider()
        .addOrUpdateMultipleTrackedEntityInstanceAttributes(resolvedAttributes);
  }

  static List<InputField> getNumericalInputFields(
    List<FormSection> formSections,
  ) {
    String valueType = "NUMBER";
    List<InputField> numericalInputFields = [];
    for (FormSection formSection in formSections) {
      numericalInputFields
          .addAll(getInputFieldsByType(formSection.inputFields!, valueType));
      if (formSection.subSections!.isNotEmpty) {
        numericalInputFields
            .addAll(getNumericalInputFields(formSection.subSections!));
      }
    }
    return numericalInputFields;
  }

  static List<InputField> getInputFieldsByType(
    List<InputField> inputFields,
    String valueType,
  ) {
    return inputFields
        .where((InputField inputField) =>
            "${inputField.valueType}".toLowerCase() ==
            "$valueType".toLowerCase())
        .toList();
  }

  static List<FormSection> getEnrollmmentFormSections() {
    List<FormSection> ogacEnrollment =
        OgacInterventionFormSection.getEnrollmentFormSections();
    List<FormSection> agywRiskAssessment = [];
    List<FormSection> agywEnrollmentForm = [];
    List<FormSection> noneAgywHtsClientIntake =
        NonAgywHTSClientInformation.getFormSections();
    List<FormSection> noneAgywHtsRegister =
        NonAgywHTSRegister.getFormSections();
    List<FormSection> noneAgywPrepScreening =
        NoneAgywEnrollmentPrepScreening.getFormSections();
    // Add form section into list
    List<FormSection> formSections = [];
    formSections.addAll(ogacEnrollment);
    formSections.addAll(agywRiskAssessment);
    formSections.addAll(agywEnrollmentForm);
    formSections.addAll(noneAgywHtsClientIntake);
    formSections.addAll(noneAgywHtsRegister);
    formSections.addAll(noneAgywPrepScreening);
    return formSections;
  }
}
