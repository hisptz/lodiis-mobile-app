import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';

class EducationInterventionCurrentSelectionState with ChangeNotifier {
  EducationBeneficiary? _currentBeneficiciary;

  EducationBeneficiary? get currentBeneficiciary => _currentBeneficiciary;

  void setCurrentBeneficiary(EducationBeneficiary? currentBeneficiciary) {
    _currentBeneficiciary = currentBeneficiciary;
    notifyListeners();
  }
}
