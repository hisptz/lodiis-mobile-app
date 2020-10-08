import 'package:flutter/foundation.dart';

class ServiceFormState with ChangeNotifier {
  // intial state
  Map _formState = Map();
  bool _isEditableMode = true;

  // selector
  Map get formState => _formState;
  bool get isEditableMode => _isEditableMode;

  //reducers
  void resetFormState() {
    _formState.clear();
    notifyListeners();
  }

  void updateFormEditabilityState({bool isEditableMode = true}) {
    _isEditableMode = isEditableMode;
    notifyListeners();
  }

  void setFormFieldState(String id, dynamic value) {
    _formState[id] = value;
    notifyListeners();
  }
}
