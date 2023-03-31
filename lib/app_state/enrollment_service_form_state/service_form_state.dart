import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/app_info_state/app_info_state.dart';
import 'package:provider/provider.dart';

class ServiceFormState with ChangeNotifier {
  final BuildContext context;

  ServiceFormState(this.context);

  // initial state
  final Map _formState = {};
  Map _hiddenFields = {};
  Map _hiddenSections = {};
  Map _hiddenInputFieldOptions = {};
  bool _isEditableMode = true;
  String _lastUpdatedFieldId = '';

  // selector
  Map get formState => _formState;
  Map get hiddenFields => _hiddenFields;
  Map get hiddenSections => _hiddenSections;
  Map get hiddenInputFieldOptions => _hiddenInputFieldOptions;
  bool get isEditableMode => _isEditableMode;
  String get lastUpdatedFieldId => _lastUpdatedFieldId;

  //reducers
  void resetFormState() {
    _formState.clear();
    _hiddenFields.clear();
    _hiddenSections.clear();
    _hiddenInputFieldOptions.clear();
    notifyListeners();
  }

  void setHiddenFields(Map hiddenFields) {
    _hiddenFields = hiddenFields;
    notifyListeners();
  }

  void setHiddenInputFieldOptions(Map hiddenInputFieldOptions) {
    _hiddenInputFieldOptions = hiddenInputFieldOptions;
    notifyListeners();
  }

  void setHiddenSections(Map hiddenSections) {
    _hiddenSections = hiddenSections;
    notifyListeners();
  }

  void updateFormEditabilityState({bool isEditableMode = true}) {
    bool shouldUpdateApp =
        Provider.of<AppInfoState>(context, listen: false).shouldUpdateTheApp ||
            Provider.of<AppInfoState>(context, listen: false)
                .showWarningToAppUpdate;
    if (!shouldUpdateApp) {
      _isEditableMode = isEditableMode;
    } else {
      _isEditableMode = false;
    }

    notifyListeners();
  }

  void setFormFieldState(
    String? id,
    dynamic value, {
    bool isChangesBasedOnSkipLogic = false,
  }) {
    if (!isChangesBasedOnSkipLogic) {
      _lastUpdatedFieldId = id!;
    }
    _formState[id] = value ?? '';
    notifyListeners();
  }

  void removeFieldFromState(String id) {
    _formState.remove(id);
    notifyListeners();
  }
}
