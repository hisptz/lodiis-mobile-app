import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/app_semantic_version.dart';
import 'package:new_version/new_version.dart';

class AppInfoState with ChangeNotifier {
  String? _currentAppName;
  String? _currentAppVersion;
  String? _currentAppId;
  bool? _canUpdate;

  String get currentAppName => _currentAppName ?? '';
  bool get canUpdate => _canUpdate ?? false;
  String get currentAppVersion => _currentAppVersion ?? '';
  String get currentAppId => _currentAppId ?? '';

  void setCurrentAppInfo() async {
    _currentAppId = AppInfoReference.androidId;
    _currentAppName = AppInfoReference.currentAppName;
    _currentAppVersion = AppInfoReference.currentAppVersion;
    try {
      final newVersion = NewVersion(
        androidId: AppInfoReference.androidId,
      );
      final status = await newVersion.getVersionStatus();
      _canUpdate = status!.canUpdate;
      _currentAppVersion = status.localVersion;
      // updateAppUpdateState(
      //   storeVersion: status.storeVersion,
      //   localVersion: status.localVersion,
      // );
      updateAppUpdateState(
        storeVersion: "1.3.7",
        localVersion: "1.3.5",
      );
    } catch (error) {}
    notifyListeners();
  }

  void updateAppUpdateState({storeVersion: String, localVersion: String}) {
    int minmunAllowedMajorVersion = 0;
    int minmunAllowedMinorVersion = 0;
    int minmunAllowedPatchVersion = 2;
    AppSemanticVersion storeSemanticVersion =
        AppUtil.getSemanticVersionValue(version: storeVersion);
    AppSemanticVersion localSemanticVersion =
        AppUtil.getSemanticVersionValue(version: localVersion);
    if (localSemanticVersion.major + minmunAllowedMajorVersion <
        storeSemanticVersion.major) {
      print("Updating the app based on major");
    } else if (localSemanticVersion.minor + minmunAllowedMinorVersion <
        storeSemanticVersion.minor) {
      print("Updating the app based on minor");
    } else if (localSemanticVersion.patch + minmunAllowedPatchVersion <
        storeSemanticVersion.patch) {
      print("Updating the app based on patch");
    } else {
      print("No need to update");
    }
    print("storeSemanticVersion => $storeSemanticVersion");
    print("localSemanticVersion => $localSemanticVersion");
  }
}
