import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_info_util.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_none_participation_constant.dart';

class AgywDreamsNoneParticipationService {
  final String program = AgywDreamsEnrollmentNoneParticipationConstant.program;
  final String programStage =
      AgywDreamsEnrollmentNoneParticipationConstant.programStage;

  final List<AgywDreamsEnrollmentNoneParticipationConstant>
      noneParticipationConstants = AgywDreamsEnrollmentNoneParticipationConstant
          .getNoneParticipationConstant();

  Future saveNoneParticipationForm(
    List<FormSection> formSections,
    Map dataObject,
    String? eventId,
  ) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    for (AgywDreamsEnrollmentNoneParticipationConstant noneParticipationConstant
        in noneParticipationConstants) {
      String dataElement = noneParticipationConstant.dataElement;
      String attribute = noneParticipationConstant.attribute;

      inputFieldIds.add(dataElement);
      if (dataObject.keys.toList().contains(attribute)) {
        dataObject[dataElement] = dataObject[attribute];
      }
    }
    String appAndDeviceTrackingDataElement =
        await AppInfoUtil.getAppAndDeviceTrackingInfo();

    if (eventId == null) {
      inputFieldIds.add(UserAccountReference.implementingPartnerDataElement);
      inputFieldIds.add(UserAccountReference.subImplementingPartnerDataElement);
      inputFieldIds.add(UserAccountReference.serviceProviderDataElement);
      CurrentUser? user = await (UserService().getCurrentUser());
      dataObject[UserAccountReference.implementingPartnerDataElement] =
          dataObject[UserAccountReference.implementingPartnerDataElement] ??
              user!.implementingPartner;
      dataObject[UserAccountReference.serviceProviderDataElement] =
          dataObject[UserAccountReference.serviceProviderDataElement] ??
              user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject[UserAccountReference.subImplementingPartnerDataElement] =
            dataObject[
                    UserAccountReference.subImplementingPartnerDataElement] ??
                user.subImplementingPartner;
      }
    }
    dataObject[UserAccountReference.appAndDeviceTrackingDataElement] =
        dataObject[UserAccountReference.appAndDeviceTrackingDataElement] ??
            appAndDeviceTrackingDataElement;
    inputFieldIds.add(UserAccountReference.appAndDeviceTrackingDataElement);
    eventId = eventId ?? dataObject['eventId'] ?? AppUtil.getUid();
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        dataObject['location'], inputFieldIds, dataObject, null, null);
    await FormUtil.savingEvent(eventData);
  }
}
