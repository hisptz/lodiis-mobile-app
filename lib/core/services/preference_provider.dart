import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static setPreferenceValue(String preferenceKey, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(preferenceKey, value);
  }

  static Future<String> getPreferenceValue(
    String preferenceKey,
  ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(preferenceKey) ?? null;
  }
}
