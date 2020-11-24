import 'package:flutter/foundation.dart';
import 'package:get_version/get_version.dart';

class AppInfoState with ChangeNotifier {
  String _currentAppName;
  String _currentAppVersion;
  String _currentAppId;
  String _currentPlatformVersion;

  String get currentAppName => _currentAppName ?? '';
  String get currentAppVersion => _currentAppVersion ?? '';
  String get currentAppId => _currentAppId ?? '';
  String get currentPlatformVersion => _currentPlatformVersion ?? '';

  void setCurrentAppInfo() async {
    try {
      _currentAppId = await GetVersion.appID;
      _currentAppVersion = await GetVersion.projectVersion;
      _currentAppName = await GetVersion.appName;
      _currentPlatformVersion = await GetVersion.platformVersion;
    } catch (e) {
      print(e.toString());
    }
    print(_currentAppId);
    print(_currentAppVersion);
    print(_currentAppName);
    print(_currentPlatformVersion);
    notifyListeners();
  }
}
