import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';

class AgywDreamEnrollmentService {
  final String program = "hOEIHJDrrvz";
  final String trackedEntityType = "XZIKX0bA8WN";
  final List<FormSection> riskAssessmentFormSections =
      AgywEnrollmentRiskAssessment.getFormSections();
  final List<FormSection> concentFormSections =
      AgywEnrollmentConcent.getFormSections();
  final List<FormSection> enrollmentFormSections =
      AgywEnrollmentFormSection.getFormSections();

  Future savingEnrollment(
    Map dataObject,
    String trackedEntityInstance,
    String orgUnit,
    String enrollment,
    String enrollmentDate,
    String incidentDate,
  ) async {
    List<String> inputFieldIds = [];
    inputFieldIds.addAll(FormUtil.getFormFieldIds(riskAssessmentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(concentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(enrollmentFormSections));

    TrackeEntityInstance trackeEntityInstanceData =
        FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(trackedEntityInstance,
            trackedEntityType, orgUnit, inputFieldIds, dataObject);
    FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(enrollment,
        enrollmentDate, incidentDate, orgUnit, program, trackedEntityInstance);
    FormUtil.savingEnrollment(enrollmentData);
  }

//on how to retrieve data from database
  Future<List<AgywDream>> getEnrollmentList() async {
    List<AgywDream> agywDreamList = [];
    try {
      List<Enrollment> enrollments =
          await EnrollmentOfflineProvider().getEnrollements(program);
      for (Enrollment enrollment in enrollments) {
        String orgnaisationUnit = enrollment.orgUnit;
        List<TrackeEntityInstance> dataHolds =
            await TrackedEntityInstanceOfflineProvider()
                .getTrackedEntityInstance([enrollment.trackedEntityInstance]);
        for (TrackeEntityInstance tei in dataHolds) {
          agywDreamList.add(AgywDream().fromTrackeEntityInstanceDataModel(
            tei,
            orgnaisationUnit,
            enrollment.status,
          ));
        }
      }
    } catch (e) {}
    return agywDreamList;
  }
}
