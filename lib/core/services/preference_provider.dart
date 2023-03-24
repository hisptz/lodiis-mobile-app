import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static setPreferenceValue(String preferenceKey, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(preferenceKey, value);
  }

  static Future<String?> getPreferenceValue(
    String preferenceKey,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(preferenceKey);
  }
}
