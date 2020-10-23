import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
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

  Future<List<OgacBeneficiary>> getOgacBeneficiaries() async {
    List<OgacBeneficiary> ogacBeneficiaries = [];
    List<Enrollment> enrollments = await EnrollmentOfflineProvider()
        .getEnrollements(OgacInterventionConstant.program);
    print(enrollments);
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
