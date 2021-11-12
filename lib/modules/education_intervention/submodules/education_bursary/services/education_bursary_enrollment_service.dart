import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_without_enrollment_criteria_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/education_bursary_enrollment_form.dart';

class EducationBursaryEnrollmentService {
  Future savingBeneficiaryEnrollment(
    Map dataObject,
    String trackedEntityInstance,
    String? orgUnit,
    String? enrollment,
    String? enrollmentDate,
    String? incidentDate,
    List<String> hiddenFields,
  ) async {
    List<FormSection> formSections =
        EducationBursaryEnrollmentForm.getFormSections();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields;
    inputFieldIds.addAll(hiddenFields);
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            BursaryInterventionConstant.trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject);
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
    if (dataObject['trackedEntityInstance'] == null) {
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        BursaryInterventionConstant.program,
        trackedEntityInstance,
      );
      await FormUtil.savingEnrollment(enrollmentData);
    }
  }

  Future<List<dynamic>> getBeneficiaries({
    int? page,
    String searchableValue = '',
    List<Map<String, dynamic>> filters = const [],
  }) async {
    List<EducationBeneficiary> beneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollmentsByProgram(BursaryInterventionConstant.program,
            page: page, isSearching: searchableValue != '');
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String? location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
      String? orgUnit = enrollment.orgUnit;
      String? createdDate = enrollment.enrollmentDate;
      String? enrollmentId = enrollment.enrollment;
      List<TrackedEntityInstance> ogacBeneficiaryList =
          await TrackedEntityInstanceOfflineProvider()
              .getTrackedEntityInstanceByIds(
                  [enrollment.trackedEntityInstance]);
      for (TrackedEntityInstance tei in ogacBeneficiaryList) {
        beneficiaries.add(EducationBeneficiary().fromTeiModel(
          tei,
          orgUnit,
          location,
          createdDate,
          enrollmentId,
        ));
      }
    }

    if (filters.isNotEmpty) {
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];
        String? school = filter['schoolName'];
        String? grade = filter['grade'];
        String? age = filter['age'];
        String? sex = filter['sex'];

        beneficiaries = sex == null
            ? beneficiaries
            : beneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.sex == sex)
                .toList();

        beneficiaries = age == null
            ? beneficiaries
            : beneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.age == age)
                .toList();

        beneficiaries = school == null
            ? beneficiaries
            : beneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.schoolName == school)
                .toList();

        beneficiaries = grade == null
            ? beneficiaries
            : beneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.grade == grade)
                .toList();

        beneficiaries = implementingPartner == null
            ? beneficiaries
            : beneficiaries
                .where((beneficiary) =>
                    beneficiary.implementingPartner == implementingPartner)
                .toList();
      }
    }

    return searchableValue == ''
        ? beneficiaries
        : beneficiaries.where((EducationBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<List<NoneParticipationBeneficiary>>
      getBursaryWithoutVulnerabilityCriteria(
          {page, String searchableValue = ''}) async {
    String programId = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        BursaryWithoutEnrollmentCriteriaConstant.programStage;

    List<NoneParticipationBeneficiary> bursaryWithoutVulnerability =
        await EventOfflineProvider().getEventsByProgram(
            programId: programId, programStageId: programStageId, page: page);

    return searchableValue == ''
        ? bursaryWithoutVulnerability
        : bursaryWithoutVulnerability
            .where((NoneParticipationBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<int> getBursaryWithoutVulnerabilityCriteriaCount() async {
    String programId = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        BursaryWithoutEnrollmentCriteriaConstant.programStage;

    return await EventOfflineProvider().getEventsByProgramCount(
        programId: programId, programStageId: programStageId);
  }

  Future saveBursaryWithoutVulnerabilityCriteria(
      List<FormSection> formSections, Map dataObject, String eventId) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    String program = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStage = BursaryWithoutEnrollmentCriteriaConstant.programStage;

    // assign implementing partner
    if (eventId == null) {
      inputFieldIds.add(UserAccountReference.implementingPartnerDataElement);
      inputFieldIds.add(UserAccountReference.subImplementingPartnerDataElement);
      CurrentUser? user = await (UserService().getCurrentUser());
      dataObject[UserAccountReference.implementingPartnerDataElement] =
          dataObject[UserAccountReference.implementingPartnerDataElement] ??
              user!.implementingPartner;
      dataObject[UserAccountReference.serviceProviderDataElement] =
          dataObject[UserAccountReference.serviceProviderDataElement] ??
              user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject[UserAccountReference.subImplementingPartnerDataElement] =
            dataObject[
                    UserAccountReference.subImplementingPartnerDataElement] ??
                user.subImplementingPartner;
      }
    }

    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        dataObject['location'], inputFieldIds, dataObject, null, null);
    await FormUtil.savingEvent(eventData);
  }

  Future<int> getBeneficiariesCount() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCount(BursaryInterventionConstant.program);
  }

  Future<Map<String, int>> getBeneficiariesCountBySex() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCountBySex(BursaryInterventionConstant.program);
  }
}
