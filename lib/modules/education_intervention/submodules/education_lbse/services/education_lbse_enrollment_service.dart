import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
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
    if (dataObject['trackedEntityInstance'] == null) {
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        LbseInterventionConstant.program,
        trackedEntityInstance,
      );
      await FormUtil.savingEnrollment(enrollmentData);
    }
  }

  Future<List<dynamic>> getBeneficiaries(
      {int? page,
      String searchableValue = '',
      List<Map<String, dynamic>> filters = const []}) async {
    List<EducationBeneficiary> educationLbseBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollments(LbseInterventionConstant.program,
            page: page, isSearching: searchableValue != '');
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String? location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
      String? orgUnit = enrollment.orgUnit;
      String? createdDate = enrollment.enrollmentDate;
      String? enrollmentId = enrollment.enrollment;
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
        ));
      }
    }

    if (filters.isNotEmpty) {
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];

        educationLbseBeneficiaries = implementingPartner == null
            ? educationLbseBeneficiaries
            : educationLbseBeneficiaries
                .where((beneficiary) =>
                    beneficiary.implementingPartner == implementingPartner)
                .toList();
      }
    }
    return searchableValue == ''
        ? educationLbseBeneficiaries
        : educationLbseBeneficiaries.where((EducationBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
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
