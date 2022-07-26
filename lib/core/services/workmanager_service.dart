import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/constants/workmanager_constants.dart';
import 'package:kb_mobile_app/core/services/data_quality_service.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:workmanager/workmanager.dart';

callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var autoSyncTaskName = WorkmanagerConstants.autoSync;
    var dataQualityTaskName = WorkmanagerConstants.dataQuality;
    try {
      if (task == autoSyncTaskName) {
        CurrentUser? currentUser = await UserService().getCurrentUser();
        if (currentUser != null) {
          SynchronizationService synchronizationService =
              SynchronizationService(currentUser.username, currentUser.password,
                  currentUser.programs, currentUser.userOrgUnitIds);
          await synchronizationService.initiateBackgroundDataSync(currentUser);
        }
      }
      if (task == dataQualityTaskName) {
        await DataQualityService.runDataQualityCheckResolution();
      }
      return Future.value(true);
    } catch (err) {
      //
      return Future.value(false);
    }
  });
}

class WorkmanagerService {
  static void init() {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  }

  static startTasks() async {
    var autoSyncTaskName = WorkmanagerConstants.autoSync;
    var dataQualityTaskName = WorkmanagerConstants.dataQuality;
    var syncTimeOut = const Duration(seconds: AutoSynchronization.syncInterval);
    var autoSync = await PreferenceProvider.getPreferenceValue(
      WorkmanagerConstants.autoSync,
    );

    await Workmanager().registerOneOffTask(
      dataQualityTaskName,
      dataQualityTaskName,
      initialDelay: const Duration(minutes: 1),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    if (autoSync != "true") {
      await Workmanager().registerPeriodicTask(
        autoSyncTaskName,
        autoSyncTaskName,
        frequency: syncTimeOut,
        initialDelay: const Duration(minutes: 3),
        existingWorkPolicy: ExistingWorkPolicy.keep,
        constraints: Constraints(networkType: NetworkType.connected),
      );
      await PreferenceProvider.setPreferenceValue(
        WorkmanagerConstants.autoSync,
        "true",
      );
    } else {}
  }

  static stop() async {
    Workmanager().cancelAll();
  }
}
