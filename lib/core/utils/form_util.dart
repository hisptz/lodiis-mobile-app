import 'dart:convert';

import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class FormUtil {
  static List<String> getFormFieldIds(List<FormSection> formSections) {
    List<String> fieldIds = [];
    for (FormSection formSection in formSections) {
      for (InputField inputField in formSection.inputFields) {
        if (inputField.id != '' && inputField.id != 'location') {
          fieldIds.add(inputField.id);
        }
      }
      List<String> subSectionFormFields =
          getFormFieldIds(formSection.subSections);
      fieldIds.addAll(subSectionFormFields);
    }
    return fieldIds;
  }

  static Events getEventPayload(
    String event,
    String program,
    String programStage,
    String orgUnit,
    List<String> inputFieldIds,
    Map dataObject,
    String eventDate,
    String trckedEntityInstance,
  ) {
    trckedEntityInstance = trckedEntityInstance ?? '';
    eventDate =
        eventDate ?? AppUtil.formattedDateTimeIntoString(DateTime.now());
    String dataValues = inputFieldIds
        .map((String dataElement) {
          dynamic value = dataObject[dataElement] ?? '';
          return '{"dataElement": "$dataElement", "value": "$value"}';
        })
        .toList()
        .join(',');
    dynamic eventJson =
        '{"event" : "$event", "eventDate":"$eventDate",  "program":"$program", "programStage":"$programStage", "trckedEntityInstance":"$trckedEntityInstance", "status":"COMPLETED", "orgUnit":"$orgUnit", "syncStatus":"not-synced", "dataValues":[$dataValues] }';
    return Events().fromJson(json.decode(eventJson));
  }

  static Future savingEvent(Events event) async {
    await EventOfflineProvider().addOrUpdateEvent(event);
  }
}
