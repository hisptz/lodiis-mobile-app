import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:new_version/new_version.dart';

class AppInfoService {
  static Future<void> updateAppStoreVersion() async {
    try {
      var newVersion = NewVersion(
        androidId: AppInfoReference.androidId,
      );
      final status = await newVersion.getVersionStatus();
      await PreferenceProvider.setPreferenceValue(
        AppInfoReference.appStoreVersionPreferenceKey,
        status != null
            ? status.storeVersion
            : AppInfoReference.currentAppVersion,
      );
    } catch (e) {
      await PreferenceProvider.setPreferenceValue(
        AppInfoReference.appStoreVersionPreferenceKey,
        AppInfoReference.currentAppVersion,
      );
    }
  }

  static Future<String> getSavedApStoreVersion() async {
    var savedStoreVersion = await PreferenceProvider.getPreferenceValue(
        AppInfoReference.appStoreVersionPreferenceKey);
    var localVersion = AppInfoReference.currentAppVersion;
    return savedStoreVersion ?? localVersion;
  }
}
