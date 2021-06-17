import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';

class AgywDreamEnrollmentService {
  final String program = 'hOEIHJDrrvz';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> riskAssessmentFormSections =
      AgywEnrollmentRiskAssessment.getFormSections();
  final List<FormSection> concentFormSections =
      AgywEnrollmentConcent.getFormSections();
  final List<FormSection> enrollmentFormSections =
      AgywEnrollmentFormSection.getFormSections();

  Future savingAgwyBeneficiary(
      Map dataObject,
      String trackedEntityInstance,
      String orgUnit,
      String enrollment,
      String enrollmentDate,
      String incidentDate,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = hiddenFields ?? [];
    inputFieldIds.addAll(FormUtil.getFormFieldIds(riskAssessmentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(concentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(enrollmentFormSections));

    TrackeEntityInstance trackeEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject,
            hasBeneficiaryId: false);
    await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    if (dataObject['trackedEntityInstance'] == null) {
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

  Future<List<AgywDream>> getAgywBenficiariesWithIncomingReferralList(
      {int page, List teiList = const [], String searchableValue = ''}) async {
    List<AgywDream> agywDreamList = [];
    try {
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getFilteredEnrollments(program,
              page: page, requiredTeiList: teiList);
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
          agywDreamList.add(AgywDream()
              .fromTeiModel(tei, orgUnit, location, createdDate, enrollmentId));
        }
      }
    } catch (e) {}
    return searchableValue == ''
        ? agywDreamList
        : agywDreamList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue
                    .toLowerCase()
                    .indexOf(searchableValue.toLowerCase()) !=
                -1)
            .toList();
  }

  Future<List<AgywDream>> getAgywBenficiaryList(
      {page, String searchableValue = ''}) async {
    List<AgywDream> agywDreamList = [];
    try {
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getEnrollements(program, page: page);
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
          agywDreamList.add(AgywDream()
              .fromTeiModel(tei, orgUnit, location, createdDate, enrollmentId));
        }
      }
    } catch (e) {}
    return searchableValue == ''
        ? agywDreamList
        : agywDreamList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue
                    .toLowerCase()
                    .indexOf(searchableValue.toLowerCase()) !=
                -1)
            .toList();
  }

  Future<int> getAgywBeneficiaryCount() async {
    return await EnrollmentOfflineProvider().getEnrollmentsCount(program);
  }

  Future<int> getIncomingReferralAgywBeneficiaryCount(
      List<String> filteredTei) async {
    return await EnrollmentOfflineProvider()
        .getFilteredEnrollmentsCount(program, filteredTei);
  }
}
