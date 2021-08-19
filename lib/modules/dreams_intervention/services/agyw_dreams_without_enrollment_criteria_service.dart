import 'package:kb_mobile_app/core/constants/service_implementing_partner.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_without_enrollment_criteria_constants.dart';

class AgywDreamsWithoutEnrollmentCriteriaService {
  final String program = AgywDreamsWithoutEnrollmentCriteriaConstant.program;
  final String programStage =
      AgywDreamsWithoutEnrollmentCriteriaConstant.programStage;

  Future saveAgywDreamsWithoutEnrollmentCriteria(
      List<FormSection> formSections, Map dataObject, String eventId) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );

    // assign implementing partner
    if (eventId == null) {
      inputFieldIds
          .add(ServiceImplementingPartner().implementingPartnerDataElement);
      inputFieldIds
          .add(ServiceImplementingPartner().subImplementingPartnerDataElement);
      CurrentUser? user = await (UserService().getCurrentUser());
      dataObject[ServiceImplementingPartner().implementingPartnerDataElement] =
          dataObject[ServiceImplementingPartner()
                  .implementingPartnerDataElement] ??
              user!.implementingPartner;
      if (user!.subImplementingPartner != '') {
        dataObject[ServiceImplementingPartner()
            .subImplementingPartnerDataElement] = dataObject[
                ServiceImplementingPartner()
                    .subImplementingPartnerDataElement] ??
            user.subImplementingPartner;
      }
    }

    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        dataObject['location'], inputFieldIds, dataObject, null, null);
    await FormUtil.savingEvent(eventData);
  }
}
