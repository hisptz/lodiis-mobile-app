import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class IntervetionCardState extends ChangeNotifier {
  // initial state
  InterventionCard _currentInterventionProgram = new InterventionCard(name: '');

  // Reducers
  void setCurrentInterventionProgram(
      InterventionCard currentInterventionProgram) {
    _currentInterventionProgram = currentInterventionProgram;
    notifyListeners();
  }

  // selectors
  InterventionCard get currentIntervetionProgram => _currentInterventionProgram;
}
