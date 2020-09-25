import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class FormUtil {
  static List<String> getFormFieldIds(List<FormSection> formSections) {
    List<String> fieldIds = [];
    for (FormSection formSection in formSections) {
      for (InputField inputField in formSection.inputFields) {
        if (inputField.id != '' && inputField.id != 'location') {
          fieldIds.add(inputField.id);
        }
      }
      List<String> subSectionFormFields =
          getFormFieldIds(formSection.subSections);
      fieldIds.addAll(subSectionFormFields);
    }
    return fieldIds;
  }

  static TrackeEntityInstance geTrackedEntityInstanceEnrollmentPayLoad(
    String trackedEntityInstance,
    String trackedEntityType,
    String orgUnit,
    List<String> inputFieldIds,
    Map dataObject,
  ) {
    trackedEntityInstance = trackedEntityInstance ?? AppUtil.getUid();
    String attributes = inputFieldIds
        .map((String attribute) {
          dynamic value = dataObject[attribute] ?? '';
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
          dynamic value = dataObject[dataElement] ?? '';
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
