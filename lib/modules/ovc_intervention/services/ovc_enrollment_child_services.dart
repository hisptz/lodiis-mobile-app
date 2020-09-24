import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
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
      //save tei
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        program,
        trackedEntityInstance,
      );
      //saving enrollmmen
    }
    for (String childTeiReference in childTeiReferences) {
      Map dataMap = Map<String, dynamic>();
      dataMap['id'] = "$parentTrackedEntityInstance-$childTeiReference";
      dataMap['fromTei'] = parentTrackedEntityInstance;
      dataMap['relationshipType'] = relationshipType;
      dataMap['toTei'] = childTeiReference;
      // saving relationship
    }
  }
}
