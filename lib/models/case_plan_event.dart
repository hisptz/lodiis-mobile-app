import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class CasePlanEvent {
  String? id;
  String? date;
  String? casePlanToGap;
  String? domainType;
  Events? eventData;

  CasePlanEvent({
    this.id,
    this.date,
    this.casePlanToGap,
    this.domainType,
    this.eventData,
  });

  CasePlanEvent toDataModel({required Events eventData}) {
    List keys = [
      OvcCasePlanConstant.casePlanDomainType,
      OvcCasePlanConstant.casePlanToGapLinkage,
    ];
    Map data = {};
    for (Map dataValueObj in eventData.dataValues) {
      String? dataElement = dataValueObj['dataElement'];
      if (dataElement != null && keys.contains(dataElement)) {
        data[dataElement] = '${dataValueObj['value']}'.trim();
      }
    }
    return CasePlanEvent(
      id: eventData.event,
      date: eventData.eventDate,
      casePlanToGap: data[OvcCasePlanConstant.casePlanToGapLinkage] ?? '',
      domainType: data[OvcCasePlanConstant.casePlanDomainType] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '';
  }
}
