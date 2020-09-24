import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_consent_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_house_hold.dart';

class OvcEnrollmentHouseHoldService {
  final String program = 'BNsDaCclOiu';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> formSections =
      OvcEnrollmentHouseHold.getFormSections();
  final List<String> consentFields = OvcEnrollmentConstant.getConsentFields();

  Future savingHouseHoldform(
    Map dataObject,
    String trackedEntityInstance,
    String orgUnit,
    String enrollment,
    String enrollmentDate,
    String incidentDate,
  ) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    inputFieldIds.addAll(consentFields);
    TrackeEntityInstance trackeEntityInstanceData =
        FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(trackedEntityInstance,
            trackedEntityType, orgUnit, inputFieldIds, dataObject);
    FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(enrollment,
        enrollmentDate, incidentDate, orgUnit, program, trackedEntityInstance);
    FormUtil.savingEnrollment(enrollmentData);
  }
}
