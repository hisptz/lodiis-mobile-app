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

  static Map<String, dynamic> getSessionNumberValidation(Map dataObject) {
    Map<String, dynamic> sessionNumnberValidation = Map();
    Map serviceToSessionMapping =
        OvcServiceFormSessionNumber.serviceToSessionMapping;
    Map<String, List<String>> sessionMapping =
        OvcServiceFormSessionNumber.sessionMapping;
    bool isSessionNumberExit = false;
    bool isSessionNumberInValid = false;
    Map<String, List<String>> interventionSessions =
        dataObject["interventionSessions"] ?? [];
    for (String serviceDataElement
        in OvcServiceFormSessionNumber.sessionMapping.keys) {
      List<String> possibleSessionNumbers =
          sessionMapping[serviceDataElement] ?? [];
      String sessionNumberDataElement =
          serviceToSessionMapping[serviceDataElement];
      if (dataObject.keys.toList().indexOf(serviceDataElement) > -1 &&
          dataObject.keys.toList().indexOf(serviceDataElement) > -1) {
        String currentSessionNumber =
            dataObject[sessionNumberDataElement] ?? "";
        if (currentSessionNumber.isNotEmpty) {
          List<String> previousSessionNumbers =
              interventionSessions[serviceDataElement] ?? [];
          // checking ofr invalid
          // checking for exisiting session
          print("currentSessionNumber => $currentSessionNumber");
          print("previousSessionNumbers => $previousSessionNumbers");
          print("possibleSessionNumbers => $possibleSessionNumbers");
        }
      }
    }
    sessionNumnberValidation["isSessionNumberExit"] = isSessionNumberExit;
    sessionNumnberValidation["isSessionNumberInValid"] = isSessionNumberInValid;
    return sessionNumnberValidation;
  }
}
