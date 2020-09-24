import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';

class OvcEnrollmentChildService {
  final String program = 'em38qztTI8s';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final String relationshipType = '';
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();

  Future savingChildrenEnrollmentForms(
    String parentTrackedEntityInstance,
    String orgUnit,
    List<Map> childrenObjects,
    String enrollment,
    String enrollmentDate,
    String incidentDate,
  ) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    List childTeiReferences = [];
    for (Map dataObject in childrenObjects) {
      String trackedEntityInstance = AppUtil.getUid();
      childTeiReferences.add(trackedEntityInstance);
      TrackeEntityInstance trackeEntityInstanceData =
          FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
        trackedEntityInstance,
        trackedEntityType,
        orgUnit,
        inputFieldIds,
        dataObject,
      );
      await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        program,
        trackedEntityInstance,
      );
      await FormUtil.savingEnrollment(enrollmentData);
    }
    for (String childTeiReference in childTeiReferences) {
      TeiRelationship teiRelationshipData = FormUtil.getTeiRelationshipPayload(
          relationshipType, parentTrackedEntityInstance, childTeiReference);
      await FormUtil.savingTeiRelationship(teiRelationshipData);
    }
  }
}
