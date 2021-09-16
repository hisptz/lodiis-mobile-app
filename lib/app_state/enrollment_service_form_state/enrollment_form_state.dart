import 'package:flutter/foundation.dart';

class EnrollmentFormState with ChangeNotifier {
  // initial state
  Map _formState = Map();
  Map _hiddenFields = Map();
  Map _hiddenInputFieldOptions = Map();
  Map _hiddenSections = Map();
  bool _isEditableMode = true;

  // selector
  Map get formState => _formState;
  Map get hiddenFields => _hiddenFields;
  Map get hiddenSections => _hiddenSections;
  Map get hiddenInputFieldOptions => _hiddenInputFieldOptions;
  bool get isEditableMode => _isEditableMode;

  //reducers
  void resetFormState() {
    updateFormEditabilityState(isEditableMode: true);
    _formState.clear();
    _hiddenFields.clear();
    _hiddenSections.clear();
    _hiddenInputFieldOptions.clear();
    notifyListeners();
  }

  void updateFormEditabilityState({bool isEditableMode = true}) {
    _isEditableMode = isEditableMode;
    notifyListeners();
  }

  void setHiddenInputFieldOptions(Map hiddenInputFieldOptions) {
    _hiddenInputFieldOptions = hiddenInputFieldOptions;
    notifyListeners();
  }

  void setHiddenFields(Map hiddenFields) {
    _hiddenFields = hiddenFields;
    notifyListeners();
  }

  void setHiddenSections(Map hiddenSections) {
    _hiddenSections = hiddenSections;
    notifyListeners();
  }

  void setFormFieldState(String? id, dynamic value) {
    _formState[id] = value ?? '';
    notifyListeners();
  }

  void removeFieldFromState(String id) {
    _formState.remove(id);
    notifyListeners();
  }
}
