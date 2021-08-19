import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionCardState with ChangeNotifier {
  // initial state
  final List<InterventionCard> interventions =
      InterventionCard.getInterventions();
  InterventionCard _currentInterventionProgram = new InterventionCard(name: '');

  // Reducers
  void setCurrentInterventionProgram(
      InterventionCard currentInterventionProgram) {
    _currentInterventionProgram = currentInterventionProgram;
    AppUtil.setStatusBarColor(currentInterventionProgram.primaryColor);
    notifyListeners();
  }

  void setCurrentInterventionProgramId(String? id) {
    int index = interventions
        .indexWhere((InterventionCard intervention) => id == intervention.id);
    setCurrentInterventionProgram(interventions[index]);
  }

  void resetCurrentInterventionProgram() {
    _currentInterventionProgram = new InterventionCard(name: '');
  }

  // selectors
  InterventionCard get currentInterventionProgram =>
      _currentInterventionProgram;
}
