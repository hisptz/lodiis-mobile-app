import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionBottomNavigationState with ChangeNotifier {
  // initial state
  int _currentInterventionBottomNavigationIndex = 0;
  String _currentInterventionBottomNavigationId;

  // Reducers
  void setCurrentInterventionBottomNavigationStatus(int index, String id) {
    _currentInterventionBottomNavigationIndex = index;
    _currentInterventionBottomNavigationId = id;
    notifyListeners();
  }

  void resetCurrentInterventionBottomNavigationIndex() {
    _currentInterventionBottomNavigationIndex = 0;
    _currentInterventionBottomNavigationId = null;
    notifyListeners();
  }

  // Selectors
  int get currentInterventionBottomNavigationIndex =>
      _currentInterventionBottomNavigationIndex;

  String get currentInterventionBottomNavigationId =>
      _currentInterventionBottomNavigationId;

  InterventionBottomNavigation getCurrentInterventionBottomNavigation(
      InterventionCard activeInterventionProgram) {
    List<InterventionBottomNavigation> interventionBottomNavigations =
        InterventionBottomNavigation.getInterventionNavigationButtons(
            activeInterventionProgram);
    InterventionBottomNavigation interventionBottomNavigation =
        interventionBottomNavigations[0];
    if (_currentInterventionBottomNavigationId != null) {
      var filteredList = interventionBottomNavigations
          .where((nav) => nav.id == _currentInterventionBottomNavigationId)
          .toList();
      interventionBottomNavigation = filteredList.length > 0
          ? filteredList[0]
          : interventionBottomNavigation;
    }
    return interventionBottomNavigation;
  }
}
