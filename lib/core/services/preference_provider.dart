import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static setPreferenceValue(String preferenceKey, String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(preferenceKey, value);
  }

  static Future<String?> getPreferenceValue(
    String preferenceKey,
  ) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(preferenceKey);
  }
}
