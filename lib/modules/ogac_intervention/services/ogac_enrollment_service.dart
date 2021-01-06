import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
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

class OgacEnrollementservice {
  Future savingOgacBeneficiaryEnrollement(
    Map dataObject,
    String trackedEntityInstance,
    String orgUnit,
    String enrollment,
    String enrollmentDate,
    String incidentDate,
    List<String> hiddenFields,
  ) async {
    List<FormSection> formSections =
        OgacInterventionFormSection.getEnrollmentFormSections();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields ?? [];
    inputFieldIds.addAll(hiddenFields);
    TrackeEntityInstance trackeEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            OgacInterventionConstant.trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject);
    await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
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

  Future<List<OgacBeneficiary>> getOgacBeneficiaries({int page}) async {
    List<OgacBeneficiary> ogacBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollements(OgacInterventionConstant.program, page: page);
    for (Enrollment enrollment in enrollments) {
      List<OrganisationUnit> ous = await OrganisationUnitService()
          .getOrganisationUnits([enrollment.orgUnit]);
      String location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
      String orgUnit = enrollment.orgUnit;
      String createdDate = enrollment.enrollmentDate;
      String enrollmentId = enrollment.enrollment;
      List<TrackeEntityInstance> ogacBeneficiaryList =
          await TrackedEntityInstanceOfflineProvider()
              .getTrackedEntityInstance([enrollment.trackedEntityInstance]);
      for (TrackeEntityInstance tei in ogacBeneficiaryList) {
        List<Events> eventList = await EventOfflineProvider()
            .getTrackedEntityInstanceEvents([tei.trackedEntityInstance]);
        Events eventData = eventList.length > 0 ? eventList[0] : null;
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
    return ogacBeneficiaries;
  }

  savingOgacBeneficiaryEvent(
    String orgUnit,
    Map dataObject,
    String trackedEntityInstance,
  ) async {
    List<String> hiddenFields = [];
    String eventId = dataObject['eventId'];
    String eventDate = dataObject['eventDate'];
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
