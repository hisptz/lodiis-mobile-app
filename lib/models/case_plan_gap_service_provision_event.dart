import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class CasePlanGapServiceProvisionEvent {
  String? id;
  String? date;
  String? result;
  String? reason;
  String? casePlanGapToServiceProvisionLinkage;
  Events? eventData;

  CasePlanGapServiceProvisionEvent({
    this.id,
    this.date,
    this.result,
    this.reason,
    this.casePlanGapToServiceProvisionLinkage,
    this.eventData,
  });

  CasePlanGapServiceProvisionEvent toDataModel({required Events eventData}) {
    List keys = [OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage];
    Map data = {};
    String followupResults = '';
    String followUpReason = '';
    for (Map dataValueObj in eventData.dataValues) {
      String? dataElement = dataValueObj['dataElement'];
      if (dataElement != null && keys.contains(dataElement)) {
        data[dataElement] = '${dataValueObj['value']}'.trim();
        if (OvcCasePlanConstant.casePlanServiceProvisionResults
            .contains(dataElement)) {
          followupResults = dataValueObj['value'] != null &&
                  '${dataValueObj['value']}'.trim() != ''
              ? '${dataValueObj['value']}'.trim()
              : followupResults;
        } else if (OvcCasePlanConstant.casePlanServiceProvisionReasons
            .contains(dataElement)) {
          followUpReason = dataValueObj['value'] != null &&
                  '${dataValueObj['value']}'.trim() != ''
              ? '${dataValueObj['value']}'.trim()
              : followUpReason;
        }
      }
    }
    return CasePlanGapServiceProvisionEvent(
      id: eventData.event,
      casePlanGapToServiceProvisionLinkage:
          data[casePlanGapToServiceProvisionLinkage] ?? '',
      date: eventData.eventDate,
      result: followupResults == "true" ? "Yes" : "No",
      reason: followUpReason,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $result';
  }
}
