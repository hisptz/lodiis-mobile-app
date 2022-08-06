import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class CasePlanGapEvent {
  String? id;
  String? date;
  String? casePlanToGap;
  String? casePlanGapToServiceProvision;
  String? casePlanGapToServiceMonitoring;
  Events? eventData;

  CasePlanGapEvent({
    this.id,
    this.date,
    this.casePlanToGap,
    this.casePlanGapToServiceProvision,
    this.casePlanGapToServiceMonitoring,
    this.eventData,
  });

  Map<String, dynamic> toDataObject() {
    Map<String, dynamic> dataObject = {
      "eventId": id,
      "eventDate": date,
    };
    for (Map dataValueObj in eventData?.dataValues ?? []) {
      String? dataElement = dataValueObj['dataElement'];
      if (dataElement != null) {
        dataObject[dataElement] = '${dataValueObj['value']}'.trim();
      }
    }
    return dataObject;
  }

  CasePlanGapEvent toDataModel({required Events eventData}) {
    List keys = [
      OvcCasePlanConstant.casePlanToGapLinkage,
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
    ];
    Map data = {};
    for (Map dataValueObj in eventData.dataValues) {
      String? dataElement = dataValueObj['dataElement'];
      if (dataElement != null && keys.contains(dataElement)) {
        data[dataElement] = '${dataValueObj['value']}'.trim();
      }
    }
    return CasePlanGapEvent(
      id: eventData.event,
      date: eventData.eventDate,
      casePlanToGap: data[OvcCasePlanConstant.casePlanToGapLinkage] ?? '',
      casePlanGapToServiceProvision:
          data[OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage] ?? '',
      casePlanGapToServiceMonitoring:
          data[OvcCasePlanConstant.casePlanGapToMonitoringLinkage] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '<$id $date $casePlanToGap [$casePlanGapToServiceMonitoring $casePlanGapToServiceProvision]>';
  }
}
