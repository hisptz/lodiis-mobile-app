import 'package:flutter/foundation.dart';
import 'package:new_version/new_version.dart';

class AppInfoState with ChangeNotifier {
  String? _currentAppName;
  String? _currentAppVersion;
  String? _currentAppId;
  String? _currentPlatformVersion;

  String get currentAppName => _currentAppName ?? '';
  String get currentAppVersion => _currentAppVersion ?? '';
  String get currentAppId => _currentAppId ?? '';
  String get currentPlatformVersion => _currentPlatformVersion ?? '';

  void setCurrentAppInfo() async {
    try {
      //@TODO add contansts
      final newVersion = NewVersion(
        androidId: 'chingalo.family.todo_app',
      );
      final status = await newVersion.getVersionStatus();
      print("${status!.canUpdate}");
      print("${status.localVersion}");
      print("${status.storeVersion}");
      print("${status.releaseNotes}");
      // TODO add a way to get the app info from the platform
      _currentAppId = '';
      _currentAppVersion = '';
      _currentAppName = '';
      _currentPlatformVersion = '';
    } catch (error) {}
    notifyListeners();
  }
}
