import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_service_form_session_number.dart';
import 'package:provider/provider.dart';

class OvcServiceProvisionUtil {
  static Map<String, List<String>> getExistingSessionNumberMapping(
    BuildContext context,
    List<String> programStageIds, {
    String? eventId = "",
  }) {
    Map serviceToSessionMapping =
        OvcServiceFormSessionNumber.serviceToSessionMapping;
    Map<String, List<String>> interventionSessions = Map();
    Map<String?, List<Events>> eventListByProgramStage =
        Provider.of<ServiceEventDataState>(context, listen: false)
            .eventListByProgramStage;
    List<Events> events = TrackedEntityInstanceUtil
            .getAllEventListFromServiceDataStateByProgramStages(
                eventListByProgramStage, programStageIds)
        .where((Events eventObject) => eventObject.event != eventId)
        .toList();
    for (String serviceDataElement
        in OvcServiceFormSessionNumber.sessionMapping.keys) {
      interventionSessions[serviceDataElement] = events
          .map((Events eventObject) {
            String sessionNumberDataElement =
                serviceToSessionMapping[serviceDataElement];
            List selectedDataValues = eventObject.dataValues
                .where((dataValue) =>
                    dataValue['dataElement'] == sessionNumberDataElement)
                .toList();
            return selectedDataValues.isNotEmpty
                ? selectedDataValues.first["value"] as String
                : "";
          })
          .where((sessionNumber) => "$sessionNumber".isNotEmpty)
          .toSet()
          .toList();
    }
    return interventionSessions;
  }
}
