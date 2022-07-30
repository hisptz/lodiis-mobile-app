import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_enrollment_form.dart';

class EducationLbseEnrollmentService {
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
        EducationLbseEnrollmentForm.getFormSections();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields;
    inputFieldIds.addAll(hiddenFields);
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            LbseInterventionConstant.trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject);
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        LbseInterventionConstant.program,
        trackedEntityInstance,
        dataObject);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<dynamic>> getBeneficiaries(
      {int? page,
      Map searchedAttributes = const {},
      List<Map<String, dynamic>> filters = const []}) async {
    List<String> accessibleOrgUnits = await OrganisationUnitService()
        .getOrganisationUnitAccessedByCurrentUser();
    List<EducationBeneficiary> educationLbseBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollmentsByProgram(LbseInterventionConstant.program,
            page: page, searchedAttributes: searchedAttributes);
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String? location = ous.isNotEmpty ? ous[0].name : enrollment.orgUnit;
      String? orgUnit = enrollment.orgUnit;
      String? createdDate = enrollment.enrollmentDate;
      String? enrollmentId = enrollment.enrollment;
      bool enrollmentOuAccessible = accessibleOrgUnits.contains(orgUnit);
      List<TrackedEntityInstance> lbseBeneficiaryList =
          await TrackedEntityInstanceOfflineProvider()
              .getTrackedEntityInstanceByIds(
                  [enrollment.trackedEntityInstance]);
      for (TrackedEntityInstance tei in lbseBeneficiaryList) {
        educationLbseBeneficiaries.add(EducationBeneficiary().fromTeiModel(
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
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];
        String? school = filter['schoolName'];
        String? grade = filter['grade'];
        String? age = filter['age'];
        String? sex = filter['sex'];

        educationLbseBeneficiaries = sex == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.sex == sex)
                .toList();

        educationLbseBeneficiaries = age == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.age == age)
                .toList();

        educationLbseBeneficiaries = school == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.schoolName == school)
                .toList();

        educationLbseBeneficiaries = grade == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.grade == grade)
                .toList();

        educationLbseBeneficiaries = implementingPartner == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((EducationBeneficiary beneficiary) =>
                    beneficiary.implementingPartner == implementingPartner)
                .toList();
      }
    }
    return educationLbseBeneficiaries;
  }

  Future<int> getBeneficiariesCount() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCount(LbseInterventionConstant.program);
  }

  Future<Map<String, int>> getBeneficiariesCountBySex() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCountBySex(LbseInterventionConstant.program);
  }
}
