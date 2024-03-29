import 'package:flutter/foundation.dart';

class LanguageTranslationState with ChangeNotifier {
  // initial state
  String? _currentLanguage;

  // selectors
  String get currentLanguage => _currentLanguage ?? '';

  bool get isSesothoLanguage => currentLanguage == 'lesotho';

  // reducers

  void setLanguageTranslation(String currentLanguage) {
    _currentLanguage = currentLanguage;
    notifyListeners();
  }
}
