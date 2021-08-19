import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';

class DreamsBeneficiarySelectionState with ChangeNotifier {
  // initiate state
  AgywDream? _currentAgywDream;

  // selectors
  AgywDream? get currentAgywDream => _currentAgywDream;

  //reducers
  void setCurrentAgywDream(AgywDream? currentAgywDream) {
    _currentAgywDream = currentAgywDream;
    notifyListeners();
  }
}
