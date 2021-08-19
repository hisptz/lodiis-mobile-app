import 'package:flutter/foundation.dart';

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
      // TODO add a way to get the app info from the platform
      _currentAppId = '';
      _currentAppVersion = '';
      _currentAppName = '';
      _currentPlatformVersion = '';
    } catch (error) {}
    notifyListeners();
  }
}
