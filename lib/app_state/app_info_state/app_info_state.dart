import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
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
    try {
      final newVersion = NewVersion(
        androidId: AppInfoReference.androidId,
      );
      final status = await newVersion.getVersionStatus();
      _canUpdate = status!.canUpdate;
      _currentAppVersion = status.localVersion;
      _currentAppId = AppInfoReference.androidId;
      _currentAppName = AppInfoReference.currentAppName;
    } catch (error) {}
    notifyListeners();
  }
}
