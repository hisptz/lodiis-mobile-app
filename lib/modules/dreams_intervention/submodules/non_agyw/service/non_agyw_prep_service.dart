import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_prep_followup_visits.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/models/Non_Agyw_Prep.dart';

class NonAgywPrepService {
  final String program = 'Yn6AJ0CAxb2';
  final String trackedEntityType = 'kvw2uGClS1A';
  final List<FormSection> nonAgywPrepFormSections =
      EnrollmentFormSection.getFormSections();
 

  Future savingNonAgywPrepVisit(
      Map dataObject,
      String trackedEntityInstance,
      String orgUnit,
      String enrollment,
      String enrollmentDate,
      String incidentDate,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = hiddenFields ?? [];
    inputFieldIds.addAll(FormUtil.getFormFieldIds(nonAgywPrepFormSections));
   

    TrackeEntityInstance trackeEntityInstanceData =
        FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(trackedEntityInstance,
            trackedEntityType, orgUnit, inputFieldIds, dataObject);
    await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(enrollment,
        enrollmentDate, incidentDate, orgUnit, program, trackedEntityInstance);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<PrepVisit>> getANonAgywPrepVisit() async {
    List<PrepVisit> agywDreamList = [];
    try {
      List<Enrollment> enrollments =
          await EnrollmentOfflineProvider().getEnrollements(program);
      for (Enrollment enrollment in enrollments) {
        // get location
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
        String orgUnit = enrollment.orgUnit;
        String createdDate = enrollment.enrollmentDate;
        String enrollmentId = enrollment.enrollment;

        List<TrackeEntityInstance> dataHolds =
            await TrackedEntityInstanceOfflineProvider()
                .getTrackedEntityInstance([enrollment.trackedEntityInstance]);
        for (TrackeEntityInstance tei in dataHolds) {
          agywDreamList.add(PrepVisit()
              .fromTeiModel(tei, orgUnit, location, createdDate, enrollmentId));
        }
      }
    } catch (e) {}
    return agywDreamList;
  }
}
