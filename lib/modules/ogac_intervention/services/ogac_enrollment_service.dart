import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_intervention_constant.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/models/ogac_enrollment_form_section.dart';

class OgacEnrollementservice {
  List<FormSection> formSections =
      OgacInterventionFormSection.getFormSections();

  Future savingOgacBeneficiaries(
    Map dataObject,
    String trackedEntityInstance,
    String orgUnit,
    String enrollment,
    String enrollmentDate,
    String incidentDate,
    bool shouldEnroll,
    List<String> hiddenFields,
  ) async {
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
    if (shouldEnroll) {
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
          enrollment,
          enrollmentDate,
          incidentDate,
          orgUnit,
          OgacInterventionConstant.program,
          trackedEntityInstance);
      await FormUtil.savingEnrollment(enrollmentData);
    }
  }
}
