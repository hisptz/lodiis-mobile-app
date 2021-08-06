import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
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
  final String relationshipType = 'UVV4IIKD73V';
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();

  Future savingChildrenEnrollmentForms(
    String parentTrackedEntityInstance,
    String orgUnit,
    List<Map> childrenObjects,
    String enrollmentDate,
    String incidentDate,
    bool shouldEnroll,
    List<String> hiddenFields,
  ) async {
    hiddenFields = hiddenFields ?? [];
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    inputFieldIds.addAll(hiddenFields);
    List childTeiReferences = [];
    for (Map dataObject in childrenObjects) {
      String trackedEntityInstance =
          dataObject['trackedEntityInstance'] ?? AppUtil.getUid();
      String enrollment = dataObject['enrollment'];
      childTeiReferences.add(trackedEntityInstance);
      TrackedEntityInstance trackedEntityInstanceData =
          await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
              trackedEntityInstance,
              trackedEntityType,
              orgUnit,
              inputFieldIds,
              dataObject,
              hasBeneficiaryId: false);
      await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
      if (shouldEnroll) {
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
    }
    for (String childTeiReference in childTeiReferences) {
      TeiRelationship teiRelationshipData = FormUtil.getTeiRelationshipPayload(
          relationshipType, parentTrackedEntityInstance, childTeiReference);
      await FormUtil.savingTeiRelationship(teiRelationshipData);
    }
  }

  Future<int> getOvcCount() async {
    return await EnrollmentOfflineProvider().getEnrollmentsCount(program);
  }
}
