import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/constants/workmanager_constants.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:workmanager/workmanager.dart';

callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var taskName = WorkmanagerConstants.autoSync;
    try {
      if (task == taskName) {
        // auto sync method
      }
      return Future.value(true);
    } catch (err) {
      //
      return Future.value(false);
    }
  });
}

class AutoSyncWorkmanagerService {
  static void init() {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  static start() async {
    var taskName = WorkmanagerConstants.autoSync;
    var syncTimeOut = const Duration(seconds: AutoSynchronization.syncInterval);
    var autoSync = await PreferenceProvider.getPreferenceValue(
      WorkmanagerConstants.autoSync,
    );

    if (autoSync != "true") {
      Workmanager().registerPeriodicTask(
        taskName,
        taskName,
        frequency: syncTimeOut,
        initialDelay: syncTimeOut,
        existingWorkPolicy: ExistingWorkPolicy.replace,
        constraints: Constraints(networkType: NetworkType.connected),
      );
      await PreferenceProvider.setPreferenceValue(
        WorkmanagerConstants.autoSync,
        "true",
      );
    }
  }

  static stop() async {
    Workmanager().cancelAll();
  }
}
