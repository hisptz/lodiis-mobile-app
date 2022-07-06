import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_info_util.dart';
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
