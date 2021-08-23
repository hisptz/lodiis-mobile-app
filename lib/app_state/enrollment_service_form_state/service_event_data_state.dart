import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';

class ServiceEventDataState with ChangeNotifier {
  // initial state
  bool _isLoading = false;
  Map _eventListByProgramStage = Map<String?, List<Events>>();

  // selector
  bool get isLoading => _isLoading;

  Map<String?, List<Events>> get eventListByProgramStage =>
      _eventListByProgramStage as Map<String?, List<Events>>? ?? Map<String, List<Events>>();

  // reducer

  void resetServiceEventDataState(
    String? trackedEntityInstance,
  ) async {
    _isLoading = true;
    _eventListByProgramStage.clear();
    notifyListeners();
    List<Events> eventList =
        await TrackedEntityInstanceUtil.getSavedTrackedEntityInstanceEventData(
            trackedEntityInstance);
    List<String?> programStages =
        eventList.map((Events event) => event.programStage).toList();
    for (String? programStage in programStages) {
      _eventListByProgramStage[programStage] = eventList
          .where((Events event) => event.programStage == programStage)
          .toList();
    }
    Timer(Duration(seconds: 1), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}
