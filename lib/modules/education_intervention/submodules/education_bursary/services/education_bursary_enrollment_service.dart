import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_info_util.dart';
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
            dataObject,
            hasBeneficiaryId: false);
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        BursaryInterventionConstant.program,
        trackedEntityInstance,
        dataObject);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<dynamic>> getBeneficiaries({
    int? page,
    Map searchedAttributes = const {},
    List<Map<String, dynamic>> filters = const [],
  }) async {
    List<String> accessibleOrgUnits = await OrganisationUnitService()
        .getOrganisationUnitAccessedByCurrentUser();
    List<EducationBeneficiary> beneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollmentsByProgram(BursaryInterventionConstant.program,
            page: page, searchedAttributes: searchedAttributes);
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String? location = ous.isNotEmpty ? ous[0].name : enrollment.orgUnit;
      String? orgUnit = enrollment.orgUnit;
      String? createdDate = enrollment.enrollmentDate;
      String? enrollmentId = enrollment.enrollment;
      bool enrollmentOuAccessible = accessibleOrgUnits.contains(orgUnit);
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
          enrollmentOuAccessible,
        ));
      }
    }

    if (filters.isNotEmpty) {
      Map<String, dynamic> metadata = {
        'filters': filters,
        'beneficiaries': beneficiaries
      };
      return await compute(filterBeneficiaries, metadata);
    }

    return beneficiaries;
  }

  List<EducationBeneficiary> filterBeneficiaries(
      Map<String, dynamic> metadata) {
    List<Map<String, dynamic>> filters =
        metadata['filters'] as List<Map<String, dynamic>>;
    List<EducationBeneficiary> beneficiaries =
        metadata['beneficiaries'] as List<EducationBeneficiary>;

    for (Map<String, dynamic> filter in filters) {
      String? implementingPartner = filter['implementingPartner'];
      String? school = filter['schoolName'];
      String? grade = filter['grade'];
      String? age = filter['age'];
      String? sex = filter['sex'];

      beneficiaries = sex == null
          ? beneficiaries
          : beneficiaries
              .where(
                  (EducationBeneficiary beneficiary) => beneficiary.sex == sex)
              .toList();

      beneficiaries = age == null
          ? beneficiaries
          : beneficiaries
              .where(
                  (EducationBeneficiary beneficiary) => beneficiary.age == age)
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

    return beneficiaries;
  }

  Future<List<NoneParticipationBeneficiary>>
      getBursaryWithoutVulnerabilityCriteria({
    page,
    Map searchedDataValues = const {},
  }) async {
    String programId = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        BursaryWithoutEnrollmentCriteriaConstant.programStage;

    List<NoneParticipationBeneficiary> bursaryWithoutVulnerability =
        await EventOfflineProvider().getEventsByProgram(
      programId: programId,
      programStageId: programStageId,
      page: page,
      searchedDataValues: searchedDataValues,
    );

    return bursaryWithoutVulnerability;
  }

  Future<int> getBursaryWithoutVulnerabilityCriteriaCount() async {
    String programId = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStageId =
        BursaryWithoutEnrollmentCriteriaConstant.programStage;

    return await EventOfflineProvider().getEventsByProgramCount(
        programId: programId, programStageId: programStageId);
  }

  Future saveBursaryWithoutVulnerabilityCriteria(
      List<FormSection> formSections, Map dataObject, String? eventId) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    String program = BursaryWithoutEnrollmentCriteriaConstant.program;
    String programStage = BursaryWithoutEnrollmentCriteriaConstant.programStage;
    String appAndDeviceTrackingDataElement =
        await AppInfoUtil.getAppAndDeviceTrackingInfo();
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
    dataObject[UserAccountReference.appAndDeviceTrackingDataElement] =
        dataObject[UserAccountReference.appAndDeviceTrackingDataElement] ??
            appAndDeviceTrackingDataElement;
    inputFieldIds.add(UserAccountReference.appAndDeviceTrackingDataElement);

    eventId = eventId ?? dataObject['eventId'] ?? AppUtil.getUid();
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
