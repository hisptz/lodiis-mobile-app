import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/constants/workmanager_constants.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:workmanager/workmanager.dart';

callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var autoSyncTaskName = WorkmanagerConstants.autoSync;
    try {
      if (task == autoSyncTaskName) {
        CurrentUser? currentUser = await UserService().getCurrentUser();
        if (currentUser != null) {
          SynchronizationService synchronizationService =
              SynchronizationService(currentUser.username, currentUser.password,
                  currentUser.programs, currentUser.userOrgUnitIds);
          synchronizationService.initiateBackgroundDataSync(currentUser);
        }
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

  static start() async {
    var autoSyncTaskName = WorkmanagerConstants.autoSync;
    var syncTimeOut = const Duration(seconds: AutoSynchronization.syncInterval);
    var autoSync = await PreferenceProvider.getPreferenceValue(
      WorkmanagerConstants.autoSync,
    );

    if (autoSync != "true") {
      Workmanager().registerPeriodicTask(
        autoSyncTaskName,
        autoSyncTaskName,
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
