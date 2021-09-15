import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class OvcServiceProvisionUtil {
  static Map<String, List<String>> getExistingSessionNumberMapping(
    BuildContext context,
    List<String> programStageIds, {
    String? eventId = "",
  }) {
    Map<String, List<String>> interventionSessions = Map();
    Map<String?, List<Events>> eventListByProgramStage =
        Provider.of<ServiceEventDataState>(context, listen: false)
            .eventListByProgramStage;
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    print(events);

    return interventionSessions;
  }
}
