import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_intervention_constant.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/models/ogac_enrollment_form_section.dart';

class OgacEnrollmentService {
  Future savingOgacBeneficiaryEnrollment(
    Map dataObject,
    String trackedEntityInstance,
    String? orgUnit,
    String? enrollment,
    String? enrollmentDate,
    String? incidentDate,
    List<String> hiddenFields,
  ) async {
    List<FormSection> formSections =
        OgacInterventionFormSection.getEnrollmentFormSections();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields;
    inputFieldIds.addAll(hiddenFields);
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            OgacInterventionConstant.trackedEntityType,
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
        OgacInterventionConstant.program,
        trackedEntityInstance,
      );
      await FormUtil.savingEnrollment(enrollmentData);
    }
    await savingOgacBeneficiaryEvent(
      orgUnit,
      dataObject,
      trackedEntityInstance,
    );
  }

  Future<List<OgacBeneficiary>> getOgacBeneficiaries(
      {int? page,
      String searchableValue = '',
      List<Map<String, dynamic>> filters = const []}) async {
    List<OgacBeneficiary> ogacBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollments(OgacInterventionConstant.program,
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
        List<Events> eventList = await EventOfflineProvider()
            .getTrackedEntityInstanceEvents([tei.trackedEntityInstance]);
        Events? eventData = eventList.length > 0 ? eventList[0] : null;
        ogacBeneficiaries.add(OgacBeneficiary().fromTeiModel(
          tei,
          orgUnit,
          location,
          createdDate,
          enrollmentId,
          eventData,
        ));
      }
    }

    if (filters.isNotEmpty) {
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];
        ogacBeneficiaries = implementingPartner == null
            ? ogacBeneficiaries
            : ogacBeneficiaries
                .where(
                    (ogac) => ogac.implementingPartner == implementingPartner)
                .toList();
      }
    }

    return searchableValue == ''
        ? ogacBeneficiaries
        : ogacBeneficiaries.where((OgacBeneficiary beneficiary) {
            bool isBeneficiaryFound = AppUtil().searchFromString(
                searchableString: beneficiary.searchableValue,
                searchedValue: searchableValue);
            return isBeneficiaryFound;
          }).toList();
  }

  Future<int> getOgacBeneficiariesCount() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentsCount(OgacInterventionConstant.program);
  }

  savingOgacBeneficiaryEvent(
    String? orgUnit,
    Map dataObject,
    String trackedEntityInstance,
  ) async {
    List<String> hiddenFields = [];
    String? eventId = dataObject['eventId'];
    String? eventDate = dataObject['eventDate'];
    List<FormSection> formSections =
        OgacInterventionFormSection.getStageFormSections();
    await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
      OgacInterventionConstant.program,
      OgacInterventionConstant.programStage,
      orgUnit,
      formSections,
      dataObject,
      eventDate,
      trackedEntityInstance,
      eventId,
      hiddenFields,
    );
  }
}
