import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';

class InterventionBottomNavigationState with ChangeNotifier {
  // initial state
  final List<InterventionBottomNavigation> interventionBottomNavigations =
      InterventionBottomNavigation.getInterventionNavigationButtons();
  int _currentInterventionBottomNavigationIndex = 0;

  // Reducers
  void setCuurrentInterventionBottomNavigationIndex(int index) {
    _currentInterventionBottomNavigationIndex = index;
    notifyListeners();
  }

  // Selectors
  int get currentInterventionBottomNavigationIndex =>
      _currentInterventionBottomNavigationIndex;

  InterventionBottomNavigation get currentInterventionBottomNavigation =>
      interventionBottomNavigations[
          _currentInterventionBottomNavigationIndex] ??
      null;
}
