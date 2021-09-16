import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';

class SynchronizationStatusState with ChangeNotifier {
  List<String> _unsyncedTeiReferences = [];
  List<String> get unsyncedTeiReferences => _unsyncedTeiReferences;

  resetSyncStatusReferences() async {
    _unsyncedTeiReferences = await EventOfflineProvider()
        .getTrackedEntityInstanceReferenceByEventSyncStatus();
    notifyListeners();
  }
}
