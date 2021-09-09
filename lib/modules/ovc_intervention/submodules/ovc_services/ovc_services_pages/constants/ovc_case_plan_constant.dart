import 'package:kb_mobile_app/models/events.dart';

class OvcCasePlanConstant {
  static final String casePlanToGapLinkage = 'ajqTV28fydL';
  static final String casePlanGapToFollowUpLinkage = 'tDWIRBsuwsB';
  static final String casePlanGapToMonitoringLinkage = 'H7BMnqZEqGN';
  static final String casePlanDomainType = 'vexrPNgPBYg';
  static final String casePlanFirstGoal = 'ADc3clrQRl4';

  static Map getMappedCasePlanWithGapsByDomain(
    List<Events> casePlanEvents,
    List<Events> casePlanGapsEvents,
  ) {
    Map sanitizedDataObject = Map();
    List<Map> mappedCasePlanGaps =
        OvcCasePlanConstant.getMappedCasePlanGaps(casePlanGapsEvents)
            as List<Map<dynamic, dynamic>>;
    for (Events casePlanEvent in casePlanEvents) {
      Map data = OvcCasePlanConstant.getMappedEventObject(casePlanEvent);
      String casePlanToGapLinkageValue =
          data[OvcCasePlanConstant.casePlanToGapLinkage] ??
              'casePlanToGapLinkage';
      data['gaps'] = mappedCasePlanGaps
          .where((Map data) =>
              '$casePlanToGapLinkageValue'.trim() != '' &&
              data.containsValue(casePlanToGapLinkageValue))
          .toList();
      if (data.containsKey(OvcCasePlanConstant.casePlanDomainType))
        sanitizedDataObject[data[OvcCasePlanConstant.casePlanDomainType]] =
            data;
    }
    return sanitizedDataObject;
  }

  static List getMappedCasePlanGaps(
    List<Events> casePlanGapsEvents,
  ) {
    return casePlanGapsEvents
        .map((Events eventData) => getMappedEventObject(eventData))
        .toList();
  }

  static Map getMappedEventObject(Events eventData) {
    Map map = Map();
    map['eventDate'] = eventData.eventDate;
    map['eventId'] = eventData.event;
    for (Map dataValue in eventData.dataValues) {
      if ('${dataValue['value']}'.trim() != '') {
        map[dataValue['dataElement']] = dataValue['value'];
      }
    }
    return map;
  }
}
