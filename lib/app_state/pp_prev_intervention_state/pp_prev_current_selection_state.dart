import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';

class PpPrevBeneficiarySelectionState with ChangeNotifier {
  PpPrevBeneficiary? _currentPpPrev;

  PpPrevBeneficiary? get currentPpPrev => _currentPpPrev;

  void setCurrentAgywDream(PpPrevBeneficiary? currentPpPrev) {
    _currentPpPrev = currentPpPrev;
    notifyListeners();
  }
}
