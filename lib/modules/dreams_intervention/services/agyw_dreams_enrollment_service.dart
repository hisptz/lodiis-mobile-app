import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_none_participation_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_without_enrollment_criteria_constants.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';

class AgywDreamsEnrollmentService {
  final String program = 'hOEIHJDrrvz';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> riskAssessmentFormSections =
      AgywEnrollmentRiskAssessment.getFormSections();
  final List<FormSection> concentFormSections =
      AgywEnrollmentConcent.getFormSections();
  final List<FormSection> enrollmentFormSections =
      AgywEnrollmentFormSection.getFormSections();

  Future savingAgywBeneficiary(
      Map dataObject,
      String? trackedEntityInstance,
      String? orgUnit,
      String? enrollment,
      String? enrollmentDate,
      String? incidentDate,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = hiddenFields;
    inputFieldIds.addAll(FormUtil.getFormFieldIds(riskAssessmentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(concentFormSections));
    inputFieldIds.addAll(FormUtil.getFormFieldIds(enrollmentFormSections));
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject,
            hasBeneficiaryId: false);
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        program,
        trackedEntityInstance,
        dataObject);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<AgywDream>> getAgywBenficiariesWithIncomingReferralList(
      {int? page, List teiList = const [], String searchableValue = ''}) async {
    List<AgywDream> agywDreamList = [];
    try {
      List<String> accessibleOrgUnits = await OrganisationUnitService()
          .getOrganisationUnitAccessedByCurrentUser();
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getFilteredEnrollments(program,
              page: page, requiredTeiList: teiList as List<String>);
      for (Enrollment enrollment in enrollments) {
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String? location = ous.isNotEmpty ? ous[0].name : enrollment.orgUnit;
        String? orgUnit = enrollment.orgUnit;
        String? createdDate = enrollment.enrollmentDate;
        String? enrollmentId = enrollment.enrollment;
        bool enrollmentOuAccessible = accessibleOrgUnits.contains(orgUnit);
        List<TrackedEntityInstance> dataHolds =
            await TrackedEntityInstanceOfflineProvider()
                .getTrackedEntityInstanceByIds(
                    [enrollment.trackedEntityInstance]);
        for (TrackedEntityInstance tei in dataHolds) {
          agywDreamList.add(AgywDream().fromTeiModel(tei, orgUnit, location,
              createdDate, enrollmentId, enrollmentOuAccessible));
        }
      }
    } catch (e) {
      //
    }
    return searchableValue == ''
        ? agywDreamList
        : agywDreamList.where((AgywDream beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<List<AgywDream>> getAgywBeneficiaryList(
      {page,
      String searchableValue = '',
      List<Map<String, dynamic>> filters = const []}) async {
    List<AgywDream> agywDreamList = [];
    try {
      List<String> accessibleOrgUnits = await OrganisationUnitService()
          .getOrganisationUnitAccessedByCurrentUser();
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getEnrollmentsByProgram(program,
              page: page, searchedValue: searchableValue);
      for (Enrollment enrollment in enrollments) {
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String? location = ous.isNotEmpty ? ous[0].name : enrollment.orgUnit;
        String? orgUnit = enrollment.orgUnit;
        String? createdDate = enrollment.enrollmentDate;
        String? enrollmentId = enrollment.enrollment;
        bool enrollmentOuAccessible = accessibleOrgUnits.contains(orgUnit);
        List<TrackedEntityInstance> dataHolds =
            await TrackedEntityInstanceOfflineProvider()
                .getTrackedEntityInstanceByIds(
                    [enrollment.trackedEntityInstance]);
        for (TrackedEntityInstance tei in dataHolds) {
          agywDreamList.add(AgywDream().fromTeiModel(tei, orgUnit, location,
              createdDate, enrollmentId, enrollmentOuAccessible));
        }
      }
    } catch (e) {
      //
    }
    if (filters.isNotEmpty) {
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];
        String? age = filter['age'];
        String? sex = filter['sex'];

        agywDreamList = implementingPartner == null
            ? agywDreamList
            : agywDreamList
                .where((AgywDream agyw) =>
                    agyw.enrolledOrganisation == implementingPartner)
                .toList();

        agywDreamList = age == null
            ? agywDreamList
            : agywDreamList.where((AgywDream agyw) => agyw.age == age).toList();

        agywDreamList = sex == null
            ? agywDreamList
            : agywDreamList.where((AgywDream agyw) => agyw.sex == sex).toList();
      }
    }

    return agywDreamList;
  }

  Future<List<NoneParticipationBeneficiary>>
      getNoneParticipationBeneficiaryList(
          {page, String searchableValue = ''}) async {
    String programId = AgywDreamsEnrollmentNoneParticipationConstant.program;
    String programStageId =
        AgywDreamsEnrollmentNoneParticipationConstant.programStage;

    List<NoneParticipationBeneficiary> dreamsNoneParticipants =
        await EventOfflineProvider().getEventsByProgram(
            programId: programId, programStageId: programStageId, page: page);

    return searchableValue == ''
        ? dreamsNoneParticipants
        : dreamsNoneParticipants
            .where((NoneParticipationBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<List<NoneParticipationBeneficiary>>
      getBeneficiariesWithoutEnrollmentCriteriaList(
          {page, String searchableValue = ''}) async {
    String programId = AgywDreamsWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        AgywDreamsWithoutEnrollmentCriteriaConstant.programStage;

    List<NoneParticipationBeneficiary> unenrolledDreamsBeneficiaries =
        await EventOfflineProvider().getEventsByProgram(
            programId: programId, programStageId: programStageId, page: page);

    return searchableValue == ''
        ? unenrolledDreamsBeneficiaries
        : unenrolledDreamsBeneficiaries
            .where((NoneParticipationBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<int> getBeneficiariesWithoutEnrollmentCriteriaCount() async {
    String programId = AgywDreamsWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        AgywDreamsWithoutEnrollmentCriteriaConstant.programStage;

    return await EventOfflineProvider().getEventsByProgramCount(
        programId: programId, programStageId: programStageId);
  }

  Future<int> getNoneParticipationCount() async {
    String programId = AgywDreamsEnrollmentNoneParticipationConstant.program;
    String programStageId =
        AgywDreamsEnrollmentNoneParticipationConstant.programStage;

    return await EventOfflineProvider().getEventsByProgramCount(
        programId: programId, programStageId: programStageId);
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
