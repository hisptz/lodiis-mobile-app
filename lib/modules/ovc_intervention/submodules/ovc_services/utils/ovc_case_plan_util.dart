import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_event.dart';
import 'package:kb_mobile_app/models/case_plan_gap_event.dart';
import 'package:kb_mobile_app/models/events.dart';

class OvcCasePlanUtil {
  static Map<String, List<Events>> getCasePlanByDates({
    required Map<String?, List<Events>> eventListByProgramStage,
    required List<String> programStageIds,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    return TrackedEntityInstanceUtil.getGroupedEventByDates(events);
  }

  static bool hasAccessToEdit(List<Events> events) {
    return events.length ==
        events
            .where((Events event) => event.enrollmentOuAccessible!)
            .toList()
            .length;
  }

  static Map getMappedCasePlanWithGapsByDomain({
    required List<Events> casePlanEvents,
    required List<Events> casePlanGapsEvents,
  }) {
    Map casePlanDataObject = {};
    for (Events casePlanEventData in casePlanEvents) {
      CasePlanEvent casePlanEvent =
          CasePlanEvent().toDataModel(eventData: casePlanEventData);
      String domainType = casePlanEvent.domainType!;
      Map casePlanObject = getMappedEventObject(casePlanEvent.eventData!);
      casePlanObject['gaps'] = casePlanGapsEvents
          .map(
            (Events casePlanGapEventData) =>
                CasePlanGapEvent().toDataModel(eventData: casePlanGapEventData),
          )
          .toList()
          .where((casePlanGapEvent) =>
              casePlanGapEvent.casePlanToGap == casePlanEvent.casePlanToGap)
          .toList()
          .map((casePlanGapEvent) =>
              getMappedEventObject(casePlanGapEvent.eventData!))
          .toList();
      casePlanDataObject[domainType] = casePlanObject;
    }
    return casePlanDataObject;
  }

  static Map getMappedEventObject(Events eventData) {
    Map map = {};
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
