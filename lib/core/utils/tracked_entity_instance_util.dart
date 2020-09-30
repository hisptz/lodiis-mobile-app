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
  ) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
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
          .getTrackedEntityInstance(trackedEntityInstanceIds);
    } catch (e) {}
    return events;
  }

  static List<Events> getAllEventListFromServiceDataState(
    Map<String, List<Events>> eventListByProgramStage,
    List<String> programStageids,
  ) {
    List<Events> events = [];
    for (String programStageid in programStageids) {
      var data = eventListByProgramStage[programStageid] ?? [];
      events.addAll(data);
    }
    return events;
  }
}


