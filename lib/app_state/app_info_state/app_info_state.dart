import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/app_semantic_version.dart';

class AppInfoState with ChangeNotifier {
  String? _currentAppName;
  String? _currentAppVersion;
  String? _currentAppId;
  VersionStatus? _versionStatus;
  NewVersion _newVersion = NewVersion();
  bool? _showWarningToAppUpdate;
  bool? _shouldUpdateTheApp;

  String get currentAppName => _currentAppName ?? '';
  bool get showWarningToAppUpdate => _showWarningToAppUpdate ?? false;
  bool get shouldUpdateTheApp => _shouldUpdateTheApp ?? false;
  String get currentAppVersion => _currentAppVersion ?? '';
  String get currentAppId => _currentAppId ?? '';
  NewVersion get newVersion => _newVersion;
  VersionStatus? get versionStatus => _versionStatus ?? null;

  Future<void> setCurrentAppInfo() async {
    _currentAppId = AppInfoReference.androidId;
    _currentAppName = AppInfoReference.currentAppName;
    _currentAppVersion = AppInfoReference.currentAppVersion;
    try {
      _newVersion = NewVersion(
        androidId: AppInfoReference.androidId,
      );
      final status = await _newVersion.getVersionStatus();
      _versionStatus = status;
      _showWarningToAppUpdate = status!.canUpdate;
      _currentAppVersion = status.localVersion;

      updateAppUpdateState(
        storeVersion: status.storeVersion,
        localVersion: status.localVersion,
      );
    } catch (error) {}
    notifyListeners();
  }

  void updateAppUpdateState({storeVersion: String, localVersion: String}) {
    AppSemanticVersion storeSemanticVersion =
        AppUtil.getSemanticVersionValue(version: storeVersion);
    AppSemanticVersion localSemanticVersion =
        AppUtil.getSemanticVersionValue(version: localVersion);
    if (localSemanticVersion.major +
            AppInfoReference.minimumAllowedMajorVersion <
        storeSemanticVersion.major) {
      _shouldUpdateTheApp = true;
    } else if (localSemanticVersion.minor +
            AppInfoReference.minimumAllowedMinorVersion <
        storeSemanticVersion.minor) {
      _shouldUpdateTheApp = true;
    } else if (!(storeSemanticVersion.patch <= localSemanticVersion.patch) &&
        storeSemanticVersion.patch - localSemanticVersion.patch <=
            AppInfoReference.minimumAllowedPatchVersion) {
      _showWarningToAppUpdate = true;
    } else if (localSemanticVersion.patch +
            AppInfoReference.minimumAllowedPatchVersion <=
        storeSemanticVersion.patch) {
      _shouldUpdateTheApp = true;
    } else {
      _shouldUpdateTheApp = false;
      _showWarningToAppUpdate = false;
    }
    notifyListeners();
  }
}
