import 'package:kb_mobile_app/core/constants/app_logs_constants.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_data_value_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/data_quality_util.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
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

  static Future<List<TrackedEntityInstance>>
      getTrackedEntityInstancesToBeUpdated(List<String> updatedTei) async {
    List<TrackedEntityInstance> teiToUpdate =
        await TrackedEntityInstanceOfflineProvider()
            .getTrackedEntityInstanceByIds(updatedTei);
    teiToUpdate = teiToUpdate.map((tei) {
      tei.syncStatus = 'not-synced';
      return tei;
    }).toList();

    return teiToUpdate;
  }

  static Future<void> migrateOptionSetsToCheckBox() async {
    List migratedAttributes = [];
    List<String> updatedTei = [];
    List<String> fieldsToBeMigrated = [
      'wtrZQadTkOL',
      'CePNVGSnj00',
    ];
    try {
      List attributesToMigrate =
          await TrackedEntityInstanceOfflineAttributeProvider()
              .getTrackedEntityAttributesValuesById(fieldsToBeMigrated);

      for (dynamic attributeData in attributesToMigrate) {
        Map resolvedAttribute = <String, dynamic>{};
        String attribute = attributeData['attribute'] ?? '';
        String trackedEntityInstance =
            attributeData['trackedEntityInstance'] ?? '';
        String value = attributeData['value'] ?? '';
        if (attribute == 'wtrZQadTkOL') {
          if (value == 'Sexual') {
            resolvedAttribute['attribute'] = 'm26lCJGANwu';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Economic/Neglect') {
            resolvedAttribute['attribute'] = 'BGJgzqszT0H';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Physical') {
            resolvedAttribute['attribute'] = 'WAjYVtFWI2n';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Emotional') {
            resolvedAttribute['attribute'] = 'lm4BA6iOdlI';
            resolvedAttribute['value'] = 'true';
          }
        } else if (attribute == 'CePNVGSnj00') {
          if (value == 'Health Facility') {
            resolvedAttribute['attribute'] = 'yI8xKOrRN9a';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Police -CGPU') {
            resolvedAttribute['attribute'] = 'ftRPTznAqUn';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Councilor') {
            resolvedAttribute['attribute'] = 'PoQuVkWjI4K';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Chief') {
            resolvedAttribute['attribute'] = 'FVBsqRoLGYW';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Social Worker') {
            resolvedAttribute['attribute'] = 'mM0mGp695z4';
            resolvedAttribute['value'] = 'true';
          } else if (value == 'Other') {
            resolvedAttribute['attribute'] = 'Yu4SpTnnAqb';
            resolvedAttribute['value'] = 'true';
          }
        }

        if (resolvedAttribute.containsKey('attribute')) {
          resolvedAttribute['trackedEntityInstance'] = trackedEntityInstance;
          resolvedAttribute['id'] =
              '$trackedEntityInstance-${resolvedAttribute['attribute']}';
          migratedAttributes.add(resolvedAttribute);
          updatedTei.add(trackedEntityInstance);
        }
      }

      if (migratedAttributes.isNotEmpty) {
        List<TrackedEntityInstance> teiToBeUpdated =
            await getTrackedEntityInstancesToBeUpdated(updatedTei);
        await TrackedEntityInstanceOfflineAttributeProvider()
            .addOrUpdateMultipleTrackedEntityInstanceAttributes(
                migratedAttributes);
        await TrackedEntityInstanceOfflineProvider()
            .addOrUpdateMultipleTrackedEntityInstance(teiToBeUpdated);
        await TrackedEntityInstanceOfflineAttributeProvider()
            .deleteTrackedEntityAttributesByIds(fieldsToBeMigrated);
      }
    } catch (e) {
      //
    }
  }

  static void runDataQualityCheckResolution() async {
    List resolvedAttributes = [];
    List<FormSection> enrollmentFormSections = getEnrollmentFormSections();
    List<InputField> numericalInputFields =
        getNumericalInputFields(enrollmentFormSections);
    List<String> attributeIds = numericalInputFields
        .map((InputField inputField) => inputField.id)
        .toList()
        .toSet()
        .toList();
    List attributes = await TrackedEntityInstanceOfflineAttributeProvider()
        .getTrackedEntityAttributesValuesById(attributeIds);
    for (Map attributeObject in attributes) {
      Map resolvedAttribute = <String, dynamic>{};
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
    await migrateOptionSetsToCheckBox();
    await deviceInformationAttributesMigration();
    await deviceInformationDataValuesMigration();
    await enrollmentSearchableValueMigration();
  }

  static Future<void> enrollmentSearchableValueMigration() async {
    int enrollmentWithoutSearchableValue = await EnrollmentOfflineProvider()
        .getOfflineEnrollmentsWithoutSearchableValueCount();

    List<int> pages =
        DataQualityUtil().getPagination(enrollmentWithoutSearchableValue);
    for (var page in pages) {
      List<Enrollment> enrollments =
          await EnrollmentOfflineProvider().getAllEnrollments(page);

      for (Enrollment enrollment in enrollments) {
        String searchableValue =
            await TrackedEntityInstanceOfflineAttributeProvider()
                .getSearchableFieldFromTrackedEntityAttributes(
                    enrollment.trackedEntityInstance ?? '');
        enrollment.searchableValue = searchableValue;
        await EnrollmentOfflineProvider().addOrUpdateEnrollment(enrollment);
      }
    }
  }

  static Future<void> deviceInformationDataValuesMigration() async {
    try {
      await EventOfflineDataValueProvider().reduceDeviceInformationDataValues();
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: '(deviceInformationDataValuesMigration) ${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
    }
  }

  static Future<void> deviceInformationAttributesMigration() async {
    try {
      await TrackedEntityInstanceOfflineAttributeProvider()
          .reduceDeviceInformationAttributes();
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: '(deviceInformationAttributesMigrations) ${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
    }
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
            inputField.valueType.toLowerCase() == valueType.toLowerCase())
        .toList();
  }

  static List<FormSection> getEnrollmentFormSections() {
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
