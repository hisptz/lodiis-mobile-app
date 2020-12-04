import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';

class TrackedEntityInstanceUtil {
  static Future savingTrackedEntityInstanceEventData(
    String program,
    String programStage,
    String orgUnit,
    List<FormSection> formSections,
    Map dataObject,
    String eventDate,
    String trackedEntityInstance,
    String eventId,
    List<String> hiddenFields,
      {
    List<String> skippedFields,
  }) async {
    hiddenFields = hiddenFields ?? [];
    skippedFields = skippedFields ?? [];
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    inputFieldIds.addAll(hiddenFields);
    inputFieldIds.removeWhere((field) => skippedFields.indexOf(field) > -1);
    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
     //clear unwanted object from the mapper : an object in clo question which signifies form to save
    dataObject.removeWhere((key, value) => key == 'NbQGlx6QZpK_clo_type');
       Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        orgUnit, inputFieldIds, dataObject, eventDate, trackedEntityInstance);
    await FormUtil.savingEvent(eventData);
  }

  static Future<List<Events>> getSavedTrackedEntityInstanceEventData(
    String trackedEntityInstance,
  ) async {
    List<Events> events = [];
    List<String> trackedEntityInstanceIds = [];
    try {
      trackedEntityInstanceIds.add(trackedEntityInstance);
      events = await EventOfflineProvider()
          .getTrackedEntityInstanceEvents(trackedEntityInstanceIds);
    } catch (e) {}
    return events;
  }

  static List<Events> getAllEventListFromServiceDataState(
    Map<String, List<Events>> eventListByProgramStage,
    List<String> programStageids,
  ) {
    programStageids = programStageids.toSet().toList();
    List<Events> events = [];
    for (String programStageid in programStageids) {
      try {
        var data = eventListByProgramStage[programStageid] ?? [];
        events.addAll(data);
      } catch (e) {}
    }
    return events;
  }

  static Map getGroupedEventByDates(List<Events> events) {
    Map groupedEvents = Map();
    List<String> eventDates = events
        .map((event) => event.eventDate)
        .toSet()
        .toList()
          ..sort((b, a) => a.compareTo(b));
    for (String eventDate in eventDates) {
      groupedEvents[eventDate] =
          events.where((event) => event.eventDate == eventDate).toList();
    }
    return groupedEvents;
  }
}
