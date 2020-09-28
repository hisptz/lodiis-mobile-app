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
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    eventId =
        eventId == null ? dataObject['eventId'] ?? AppUtil.getUid() : eventId;
    Events eventData = FormUtil.getEventPayload(eventId, program, programStage,
        orgUnit, inputFieldIds, dataObject, eventDate, trackedEntityInstance);
    print(Events().toJson(eventData));
  }
}
