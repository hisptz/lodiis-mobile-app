import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_intervention_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/models/pp_prev_enrollment_form.dart';

class PpPrevEnrollmentService {
  Future savingBeneficiaryEnrollment(
    Map dataObject,
    String trackedEntityInstance,
    String? orgUnit,
    String? enrollment,
    String? enrollmentDate,
    String? incidentDate,
    List<String> hiddenFields,
  ) async {
    List<FormSection> formSections = PpPrevEnrollmentForm.getFormSections();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields;
    inputFieldIds.addAll(hiddenFields);
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            PpPrevInterventionConstant.trackedEntityType,
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
        PpPrevInterventionConstant.program,
        trackedEntityInstance,
      );
      await FormUtil.savingEnrollment(enrollmentData);
    }
  }

  Future<List<dynamic>> getBeneficiaries(
      {int? page,
      String searchableValue = '',
      List<Map<String, dynamic>> filters = const []}) async {
    //@TODO finsd all valid ou using user access of current user
    List<PpPrevBeneficiary> ppPrevBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollments(PpPrevInterventionConstant.program,
            page: page, isSearching: searchableValue != '');
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String? location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
      String? orgUnit = enrollment.orgUnit;
      String? createdDate = enrollment.enrollmentDate;
      String? enrollmentId = enrollment.enrollment;
      List<TrackedEntityInstance> ppPrevBeneficiaryList =
          await TrackedEntityInstanceOfflineProvider()
              .getTrackedEntityInstanceByIds(
                  [enrollment.trackedEntityInstance]);
      for (TrackedEntityInstance tei in ppPrevBeneficiaryList) {
        ppPrevBeneficiaries.add(PpPrevBeneficiary().fromTeiModel(
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
        String? sex = filter['sex'];
        String? age = filter['age'];

        ppPrevBeneficiaries = implementingPartner == null
            ? ppPrevBeneficiaries
            : ppPrevBeneficiaries
                .where((beneficiary) =>
                    beneficiary.implementingPartner == implementingPartner)
                .toList();

        ppPrevBeneficiaries = age == null
            ? ppPrevBeneficiaries
            : ppPrevBeneficiaries
                .where((beneficiary) => beneficiary.age == age)
                .toList();

        ppPrevBeneficiaries = sex == null
            ? ppPrevBeneficiaries
            : ppPrevBeneficiaries
                .where((beneficiary) => beneficiary.sex == sex)
                .toList();
      }
    }
    return searchableValue == ''
        ? ppPrevBeneficiaries
        : ppPrevBeneficiaries.where((PpPrevBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<int> getBeneficiariesCount() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCount(PpPrevInterventionConstant.program);
  }
}
