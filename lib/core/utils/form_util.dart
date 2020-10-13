import 'dart:convert';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/reserved_value_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class FormUtil {
  static List<FormSection> getFormSectionWithReadOnlyStatus(
      List<FormSection> formSections,
      bool isReadObly,
      List<String> skippedInputs) {
    List<FormSection> sanitizedFormSections = [];
    for (FormSection formSection in formSections) {
      List<InputField> inputFields = getInputFieldsWithStatus(
          formSection.inputFields, isReadObly, skippedInputs);
      List<FormSection> subSection = getFormSectionWithReadOnlyStatus(
          formSection.subSections, isReadObly, skippedInputs);
      formSection.inputFields = inputFields;
      formSection.subSections = subSection;
      sanitizedFormSections.add(formSection);
    }
    return sanitizedFormSections;
  }

  static List<InputField> getInputFieldsWithStatus(
    List<InputField> inputFields,
    bool isReadObly,
    List<String> skippedInputs,
  ) {
    return inputFields.map((InputField inputField) {
      if (inputField.id != '' && skippedInputs.indexOf(inputField.id) == -1) {
        inputField.isReadObly = isReadObly;
      }
      return inputField;
    }).toList();
  }

  static List<String> getFormFieldIds(List<FormSection> formSections) {
    List<String> fieldIds = [];
    for (FormSection formSection in formSections) {
      for (InputField inputField in formSection.inputFields) {
        if (inputField.id != '' && inputField.id != 'location') {
          fieldIds.add(inputField.id);
        }
        if (inputField.valueType == 'CHECK_BOX') {
          for (var option in inputField.options) {
            fieldIds.add(option.code);
          }
        }
      }
      List<String> subSectionFormFields =
          getFormFieldIds(formSection.subSections);
      fieldIds.addAll(subSectionFormFields);
    }
    return fieldIds;
  }

  static List<InputField> getFormInputFields(List<FormSection> formSections) {
    List<InputField> inputFields = [];
    for (FormSection formSection in formSections) {
      List<InputField> subSectionFormFields =
          getFormInputFields(formSection.subSections);
      inputFields.addAll(formSection.inputFields);
      inputFields.addAll(subSectionFormFields);
    }
    return inputFields;
  }

  static Future<TrackeEntityInstance> geTrackedEntityInstanceEnrollmentPayLoad(
    String trackedEntityInstance,
    String trackedEntityType,
    String orgUnit,
    List<String> inputFieldIds,
    Map dataObject,
  ) async {
    trackedEntityInstance = trackedEntityInstance ?? AppUtil.getUid();
    String beneficiaryIndex =
        dataObject[BeneficiaryIdentification.beneficiaryIndex] ??
            await ReservedValueService().getReservedAttributeValue();
    List<OrganisationUnit> organisationUnits =
        await OrganisationUnitService().getOrganisationUnits([orgUnit]);
    OrganisationUnit organisationUnit =
        organisationUnits.length > 0 ? organisationUnits[0] : null;
    dataObject[BeneficiaryIdentification.beneficiaryId] =
        dataObject[BeneficiaryIdentification.beneficiaryId] =
            dataObject[BeneficiaryIdentification.beneficiaryIndex] != null
                ? dataObject[BeneficiaryIdentification.beneficiaryId]
                : BeneficiaryIdentification().getBenificiaryId(
                    organisationUnit, dataObject, beneficiaryIndex);
    dataObject[BeneficiaryIdentification.beneficiaryIndex] = beneficiaryIndex;
    String attributes = inputFieldIds
        .map((String attribute) {
          String value = dataObject.keys.toList().indexOf(attribute) > -1
              ? '${dataObject[attribute]}'.trim()
              : '';
          return '{"attribute": "$attribute", "value": "$value"}';
        })
        .toList()
        .join(',');
    dynamic trackedEnrityInstanceJson =
        '{"trackedEntityInstance":"$trackedEntityInstance", "trackedEntityType":"$trackedEntityType", "orgUnit":"$orgUnit","syncStatus":"not-synced","attributes":[$attributes] }';
    return TrackeEntityInstance()
        .fromJson(json.decode(trackedEnrityInstanceJson));
  }

  static Enrollment getEnrollmentPayLoad(
    String enrollment,
    String enrollmentDate,
    String incidentDate,
    String orgUnit,
    String program,
    String trackedEntityInstance,
  ) {
    enrollment = enrollment ?? AppUtil.getUid();
    enrollmentDate =
        enrollmentDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    incidentDate =
        incidentDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    dynamic enrollmentJson =
        '{"enrollment":"$enrollment", "enrollmentDate":"$enrollmentDate","incidentDate":"$incidentDate","orgUnit":"$orgUnit","program":"$program","trackedEntityInstance":"$trackedEntityInstance","status":"ACTIVE","syncStatus":"not-synced" }';
    return Enrollment().fromJson(json.decode(enrollmentJson));
  }

  static TeiRelationship getTeiRelationshipPayload(
    String relationshipType,
    String fromTei,
    String toTei,
  ) {
    String id = '$fromTei-$toTei';
    dynamic source =
        '{"id":"$id","relationshipType":"$relationshipType","toTei":"$toTei", "fromTei":"$fromTei"}';
    return TeiRelationship().fromJson(json.decode(source));
  }

  static Events getEventPayload(
    String event,
    String program,
    String programStage,
    String orgUnit,
    List<String> inputFieldIds,
    Map dataObject,
    String eventDate,
    String trackedEntityInstance,
  ) {
    event = event ?? AppUtil.getUid();
    trackedEntityInstance = trackedEntityInstance ?? '';
    eventDate =
        eventDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    String dataValues = inputFieldIds
        .map((String dataElement) {
          String value = dataObject.keys.toList().indexOf(dataElement) > -1
              ? '${dataObject[dataElement]}'.trim()
              : '';
          return '{"dataElement": "$dataElement", "value": "$value"}';
        })
        .toList()
        .join(',');
    dynamic eventJson =
        '{"event" : "$event", "eventDate":"$eventDate",  "program":"$program", "programStage":"$programStage", "trackedEntityInstance":"$trackedEntityInstance", "status":"COMPLETED", "orgUnit":"$orgUnit", "syncStatus":"not-synced", "dataValues":[$dataValues] }';
    return Events().fromJson(json.decode(eventJson));
  }

  static Future savingTrackeEntityInstance(
    TrackeEntityInstance trackedEntityInstance,
  ) async {
    await TrackedEntityInstanceOfflineProvider()
        .addOrUpdateTrackedEntityInstance(trackedEntityInstance);
    await ReservedValueService().cleanUsedReservedValues();
  }

  static Future savingEnrollment(Enrollment enrollment) async {
    await EnrollmentOfflineProvider().addOrUpdateEnrollement(enrollment);
  }

  static Future savingTeiRelationship(TeiRelationship teiRelationship) async {
    await TeiRelatioShipOfflineProvider()
        .addOrUpdateTeirelationShip(teiRelationship);
  }

  static Future savingEvent(Events event) async {
    await EventOfflineProvider().addOrUpdateEvent(event);
  }
}
