import 'package:flutter/foundation.dart';

class LoginFormState with ChangeNotifier {
  // initial state
  bool _isLoginProcessActive;
  bool _isPasswordVisible;
  String _activeInput;
  bool _hasLoginFormError;

  // Selectors
  bool get isLoginProcessActive => _isLoginProcessActive ?? false;

  bool get isPasswordVisible => _isPasswordVisible ?? false;

  String get activeInput => _activeInput ?? '';

  bool get hasLoginFormError => _hasLoginFormError ?? false;

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

  setHasLoginErrorStatus(bool value) {
    _hasLoginFormError = value;
    notifyListeners();
  }
}
