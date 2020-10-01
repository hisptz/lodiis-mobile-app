import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollement_none_participation_constant.dart';

class OvcNoneParticipationService {
  final String program = OvcEnrollmentNoneParticipationConstant.program;
  final String programStage =
      OvcEnrollmentNoneParticipationConstant.programStage;
  final List<OvcEnrollmentNoneParticipationConstant> noneParticipationContants =
      OvcEnrollmentNoneParticipationConstant.getNoneParticipationConstant();

  Future saveNoneParticipationForm(
      List<FormSection> formSections, Map dataObject, String eventId) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    for (OvcEnrollmentNoneParticipationConstant noneParticipationContant
        in noneParticipationContants) {
      String dataElement = noneParticipationContant.dataElement;
      String attribute = noneParticipationContant.attribute;
      inputFieldIds.add(dataElement);
      if (dataObject.keys.toList().indexOf(attribute) != -1) {
        dataObject[dataElement] = dataObject[attribute];
      }
    }
    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        dataObject['location'], inputFieldIds, dataObject, null, null);
    await FormUtil.savingEvent(eventData);
  }
}
