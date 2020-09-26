import 'package:flutter/foundation.dart';

class ServiceFormState with ChangeNotifier {
  // intial state
  Map _formState = Map();

  // selector
  Map get formState => _formState;

  //reducers
  resetFormState() {
    _formState = Map();
    notifyListeners();
  }

  setFormFieldState(String id, dynamic value) {
    _formState[id] = value;
    notifyListeners();
  }
}
