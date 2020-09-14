import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionBottomNavigationState with ChangeNotifier {
  // initial state
  int _currentInterventionBottomNavigationIndex = 0;

  // Reducers
  void setCurrentInterventionBottomNavigationIndex(int index) {
    _currentInterventionBottomNavigationIndex = index;
    notifyListeners();
  }

  // Selectors
  int get currentInterventionBottomNavigationIndex =>
      _currentInterventionBottomNavigationIndex;

  InterventionBottomNavigation getCurrentInterventionBottomNavigation(
      InterventionCard activeInterventionProgram) {
    List<InterventionBottomNavigation> interventionBottomNavigation =
        InterventionBottomNavigation.getInterventionNavigationButtons(
            activeInterventionProgram);

    return interventionBottomNavigation[
            _currentInterventionBottomNavigationIndex] ??
        null;
  }
}
