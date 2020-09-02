import 'package:flutter/foundation.dart';

class LoginFormState with ChangeNotifier {
  // initial state
  bool _isLoginProcessActive;
  bool _isPasswordVisible;
  String _activeInput;

  // Selectors
  bool get isLoginProcessActive => _isLoginProcessActive ?? false;

  bool get isPasswordVisible => _isPasswordVisible ?? false;

  String get activeInput => _activeInput ?? '';

  // reducer for the state
  setIsLoginProcessActive(bool value) {
    _isLoginProcessActive = value;
    notifyListeners();
  }

  setIsPasswordVisible(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  setActiveInput(String value) {
    _activeInput = value;
    notifyListeners();
  }
}
