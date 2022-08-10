import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';

class DeviceTrackingService {
  final String lastLoginKey = 'lastLogin';
  final String lastMetadataDownloadDateKey = "lastMetataSyncPreferenceKey";
  final String lastDataDownloadDateKey = "lastSyncDatePreferenceKey";
  final String lastDataUploadDateKey = "lastDataUploadDatePreferenceKey";

  /// get payload TEI
  /// profile info
  /// get devies details
  /// get app details
  /// sync info
  /// user account

  Future<String> getLastMetaDataSyncDate() async {
    String lastMetadataDownloadDate = '';
    try {
      var date = await PreferenceProvider.getPreferenceValue(
          lastMetadataDownloadDateKey);
      lastMetadataDownloadDate = date ?? lastMetadataDownloadDate;
    } catch (e) {
      //
    }
    return lastMetadataDownloadDate;
  }

  Future setLastMetaDataSyncDate({String date = ''}) async {
    date = date.isEmpty
        ? AppUtil.formattedDateTimeIntoString(DateTime.now())
        : date;
    await PreferenceProvider.setPreferenceValue(
        lastMetadataDownloadDateKey, date);
  }

  Future<String> getLastDataDownloadDatae() async {
    String lastDataDownloadDate = '';
    try {
      var date =
          await PreferenceProvider.getPreferenceValue(lastDataDownloadDateKey);
      lastDataDownloadDate = date ?? lastDataDownloadDate;
    } catch (e) {
      //
    }
    return lastDataDownloadDate;
  }

  Future<String> getLastDataUploadDatae() async {
    String lastDataUploadDate = '';
    try {
      var date =
          await PreferenceProvider.getPreferenceValue(lastDataUploadDateKey);
      lastDataUploadDate = date ?? lastDataUploadDate;
    } catch (e) {
      //
    }
    return lastDataUploadDate;
  }

  Future<String> getLastLoginDate({
    required String username,
  }) async {
    String lastLoginDate = '';
    try {
      String preferenceKey = "${username}_$lastLoginKey";
      var date = await PreferenceProvider.getPreferenceValue(preferenceKey);
      lastLoginDate = date ?? lastLoginDate;
    } catch (e) {
      //
    }
    return lastLoginDate;
  }

  Future setLastLoginDate({
    required String username,
    String date = '',
  }) async {
    date = date.isEmpty
        ? AppUtil.formattedDateTimeIntoString(DateTime.now())
        : date;
    String preferenceKey = "${username}_$lastLoginKey";
    await PreferenceProvider.setPreferenceValue(preferenceKey, date);
  }
}
