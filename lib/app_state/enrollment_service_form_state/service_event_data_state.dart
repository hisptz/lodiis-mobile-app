import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class ServiceEventDataState with ChangeNotifier {
  final BuildContext? context;
  // initial state
  bool _isLoading = false;
  Map _eventListByProgramStage = Map<String?, List<Events>>();

  ServiceEventDataState(this.context);

  // selector
  bool get isLoading => _isLoading;

  Map<String?, List<Events>> get eventListByProgramStage =>
      _eventListByProgramStage as Map<String?, List<Events>>? ??
      Map<String, List<Events>>();

  // reducer

  void resetServiceEventDataState(
    String? trackedEntityInstance,
  ) async {
    _isLoading = true;
    _eventListByProgramStage.clear();
    notifyListeners();
    List<String> accessibleOrgUnits = await OrganisationUnitService()
        .getOrganisationUnitAccessedByCurrentUser();
    List<Events> eventList =
        await TrackedEntityInstanceUtil.getSavedTrackedEntityInstanceEventData(
      trackedEntityInstance,
      accessibleOrgUnits: accessibleOrgUnits,
    );
    List<String?> programStages =
        eventList.map((Events event) => event.programStage).toList();
    for (String? programStage in programStages) {
      _eventListByProgramStage[programStage] = eventList
          .where((Events event) => event.programStage == programStage)
          .toList();
    }
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
    Timer(Duration(seconds: 1), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}
