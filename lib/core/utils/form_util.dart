import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/reserved_attribute_value_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class FormUtil {
  static updateServiceFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('location', eventData.orgUnit);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  static List<FormSection> getFormSectionWithReadOnlyStatus(
      List<FormSection> formSections,
      bool isReadOnly,
      List<String> skippedInputs) {
    List<FormSection> sanitizedFormSections = [];
    for (FormSection formSection in formSections) {
      List<InputField> inputFields = getInputFieldsWithStatus(
          formSection.inputFields!, isReadOnly, skippedInputs);
      List<FormSection> subSection = getFormSectionWithReadOnlyStatus(
          formSection.subSections!, isReadOnly, skippedInputs);
      formSection.inputFields = inputFields;
      formSection.subSections = subSection;
      sanitizedFormSections.add(formSection);
    }
    return sanitizedFormSections;
  }

  static List<InputField> getInputFieldsWithStatus(
    List<InputField> inputFields,
    bool isReadOnly,
    List<String> skippedInputs,
  ) {
    return inputFields.map((InputField inputField) {
      if (inputField.id != '' && !skippedInputs.contains(inputField.id)) {
        inputField.isReadOnly = isReadOnly;
      }
      return inputField;
    }).toList();
  }

  static List<FormSection> getFlattenFormSections(
      List<FormSection> formSections) {
    List<FormSection> sections = [];
    for (FormSection formSection in formSections) {
      if (formSection.subSections!.isNotEmpty) {
        sections.addAll(getFlattenFormSections(formSection.subSections!));
      }
      // formSection.subSections = [];
      sections.add(formSection);
    }
    return sections;
  }

  static List<String> getFormFieldIds(
    List<FormSection> formSections, {
    bool includeLocationId = false,
  }) {
    List<String> fieldIds = [];
    for (FormSection formSection in formSections) {
      for (InputField inputField in formSection.inputFields!) {
        if (inputField.id != '' && inputField.valueType != 'CHECK_BOX') {
          fieldIds.add(inputField.id);
        }
        if (inputField.valueType == 'CHECK_BOX') {
          for (var option in inputField.options!) {
            fieldIds.add(option.code);
          }
        }
      }
      List<String> subSectionFormFields =
          getFormFieldIds(formSection.subSections!);
      fieldIds.addAll(subSectionFormFields);
    }
    return includeLocationId
        ? fieldIds
        : fieldIds.where((String id) => id != 'location').toList();
  }

  static bool geFormFilledStatus(
      Map dataObject, List<FormSection>? formSections) {
    bool isFormFilled = false;
    if (dataObject.keys.isNotEmpty) {
      List<String> inputFields = getFormFieldIds(formSections!);
      for (String id in inputFields) {
        if (dataObject.containsKey(id) && '${dataObject[id]}'.trim() != '') {
          isFormFilled = true;
        }
      }
    }

    return isFormFilled;
  }

  static List<InputField> getFormInputFields(List<FormSection> formSections) {
    List<InputField> inputFields = [];
    for (FormSection formSection in formSections) {
      List<InputField> subSectionFormFields =
          getFormInputFields(formSection.subSections!);
      inputFields.addAll(formSection.inputFields!);
      inputFields.addAll(subSectionFormFields);
    }
    return inputFields;
  }

  static Future<TrackedEntityInstance> geTrackedEntityInstanceEnrollmentPayLoad(
      String? trackedEntityInstance,
      String trackedEntityType,
      String? orgUnit,
      List<String> inputFieldIds,
      Map dataObject,
      {bool hasBeneficiaryId = true}) async {
    trackedEntityInstance = trackedEntityInstance ?? AppUtil.getUid();
    String? beneficiaryIndex =
        dataObject[BeneficiaryIdentification.beneficiaryIndex] ??
            await ReservedAttributeValueService().getReservedAttributeValue();
    List<OrganisationUnit> organisationUnits =
        await OrganisationUnitService().getOrganisationUnits([orgUnit]);
    OrganisationUnit? organisationUnit =
        organisationUnits.isNotEmpty ? organisationUnits[0] : null;
    if (hasBeneficiaryId) {
      dataObject[BeneficiaryIdentification.beneficiaryId] =
          dataObject[BeneficiaryIdentification.beneficiaryId] =
              dataObject[BeneficiaryIdentification.beneficiaryIndex] != null
                  ? dataObject[BeneficiaryIdentification.beneficiaryId]
                  : BeneficiaryIdentification().getBenificiaryId(
                      organisationUnit!, dataObject, beneficiaryIndex);
      dataObject[BeneficiaryIdentification.beneficiaryIndex] = beneficiaryIndex;
    }

    String attributes = inputFieldIds
        .toSet()
        .toList()
        .map((String attribute) {
          String value = dataObject.keys.toList().contains(attribute)
              ? '${dataObject[attribute]}'.trim()
              : '';
          return attribute != ''
              ? '{"attribute": "$attribute", "value": "$value"}'
              : '';
        })
        .toList()
        .join(',');
    dynamic trackedEntityInstanceJson =
        '{"trackedEntityInstance":"$trackedEntityInstance", "trackedEntityType":"$trackedEntityType", "orgUnit":"$orgUnit","syncStatus":"not-synced","attributes":[$attributes] }';
    return TrackedEntityInstance()
        .fromJson(json.decode(trackedEntityInstanceJson));
  }

  static Enrollment getEnrollmentPayLoad(
    String? enrollment,
    String? enrollmentDate,
    String? incidentDate,
    String? orgUnit,
    String program,
    String? trackedEntityInstance,
    Map? dataObject,
  ) {
    enrollment = enrollment ?? AppUtil.getUid();
    enrollmentDate =
        enrollmentDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    incidentDate =
        incidentDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());

    String searchableValue =
        dataObject != null ? _getSearchableFieldFromDataObject(dataObject) : '';
    dynamic enrollmentJson =
        '{"enrollment":"$enrollment", "enrollmentDate":"$enrollmentDate","incidentDate":"$incidentDate","orgUnit":"$orgUnit","program":"$program","trackedEntityInstance":"$trackedEntityInstance","status":"ACTIVE","syncStatus":"not-synced", "searchableValue":"$searchableValue" }';
    return Enrollment().fromJson(json.decode(enrollmentJson));
  }

  static String _getSearchableFieldFromDataObject(Map dataObjet) {
    String searchableField = '';

    List<String> searchableFields = [
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'VJiWumvINR6',
      'klLkGxy328c',
      BeneficiaryIdentification.beneficiaryId,
      BeneficiaryIdentification.primaryUIC,
      BeneficiaryIdentification.secondaryUIC,
    ];

    for (String field in searchableFields) {
      if (dataObjet[field] != null) {
        searchableField += '${dataObjet[field]} ';
      }
    }
    return searchableField.trim();
  }

  static TeiRelationship getTeiRelationshipPayload(
    String relationshipType,
    String? fromTei,
    String toTei,
  ) {
    String id = AppUtil.getUid();
    dynamic source =
        '{"id":"$id","relationshipType":"$relationshipType","toTei":"$toTei", "fromTei":"$fromTei", "syncStatus": "not-synced"}';
    return TeiRelationship().fromJson(json.decode(source));
  }

  static Events getEventPayload(
    String? event,
    String? program,
    String? programStage,
    String? orgUnit,
    List<String> inputFieldIds,
    Map? dataObject,
    String? eventDate,
    String? trackedEntityInstance,
  ) {
    event = event ?? AppUtil.getUid();
    trackedEntityInstance = trackedEntityInstance ?? '';
    eventDate =
        eventDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    String dataValues = inputFieldIds
        .toSet()
        .toList()
        .map((String dataElement) {
          String value = dataObject!.keys.toList().contains(dataElement)
              ? '${dataObject[dataElement]}'.trim()
              : '';
          return dataElement != ''
              ? '{"dataElement": "$dataElement", "value": "$value"}'
              : '';
        })
        .toList()
        .join(',');
    dynamic eventJson =
        '{"event" : "$event", "eventDate":"$eventDate",  "program":"$program", "programStage":"$programStage", "trackedEntityInstance":"$trackedEntityInstance", "status":"COMPLETED", "orgUnit":"$orgUnit", "syncStatus":"not-synced", "dataValues":[$dataValues] }';
    return Events().fromJson(json.decode(eventJson));
  }

  static Future savingTrackedEntityInstance(
    TrackedEntityInstance trackedEntityInstance,
  ) async {
    await TrackedEntityInstanceOfflineProvider()
        .addOrUpdateTrackedEntityInstance(trackedEntityInstance);
    await ReservedAttributeValueService().cleanUsedReservedAttributeValues();
  }

  static Future savingEnrollment(Enrollment enrollment) async {
    await EnrollmentOfflineProvider().addOrUpdateEnrollment(enrollment);
  }

  static Future savingTeiRelationship(TeiRelationship teiRelationship) async {
    await TeiRelationshipOfflineProvider()
        .addOrUpdateTeiRelationship(teiRelationship);
  }

  static Future savingEvent(Events event) async {
    await EventOfflineProvider().addOrUpdateEvent(event);
  }
}
