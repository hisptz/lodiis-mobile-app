import 'package:kb_mobile_app/core/constants/service_implementing_partner.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_none_participation_constant.dart';

class AgywDreamsNoneParticipationService {
  final String program = AgywDreamsEnrollmentNoneParticipationConstant.program;
  final String programStage =
      AgywDreamsEnrollmentNoneParticipationConstant.porgramStage;

  final List<AgywDreamsEnrollmentNoneParticipationConstant>
      noneParticipationConstants = AgywDreamsEnrollmentNoneParticipationConstant
          .getNoneParticipationConstant();

  Future saveNoneParticipationForm(
      List<FormSection> formSections, Map dataObject, String eventId) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    for (AgywDreamsEnrollmentNoneParticipationConstant noneParticipationConstant
        in noneParticipationConstants) {
      String dataElement = noneParticipationConstant.dataElement;
      String attribute = noneParticipationConstant.attribute;

      inputFieldIds.add(dataElement);
      if (dataObject.keys.toList().indexOf(attribute) != -1) {
        dataObject[dataElement] = dataObject[attribute];
      }
    }

    // assign implementing partner
    if (eventId == null) {
      inputFieldIds
          .add(ServiceImplementingPartner().implementingPartnerDataElement);
      CurrentUser user = await UserService().getCurrentUser();
      dataObject[ServiceImplementingPartner().implementingPartnerDataElement] =
          dataObject[ServiceImplementingPartner()
                  .implementingPartnerDataElement] ??
              user.implementingPartner;
    }

    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        dataObject['location'], inputFieldIds, dataObject, null, null);
    await FormUtil.savingEvent(eventData);
  }
}
