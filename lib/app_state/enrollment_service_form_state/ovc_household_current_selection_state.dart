import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';

class OvcHouseholdCurrentSelectionState with ChangeNotifier {
  // initiate state
  OvcHousehold? _currentOvcHousehold;
  OvcHouseholdChild? _currentOvcHouseholdChild;

  // selectors
  OvcHousehold? get currentOvcHousehold => _currentOvcHousehold;
  OvcHouseholdChild? get currentOvcHouseholdChild => _currentOvcHouseholdChild;

  //reducers
  void setCurrentHousehold(OvcHousehold currentOvcHousehold) {
    _currentOvcHousehold = currentOvcHousehold;
    notifyListeners();
  }

  void setCurrentHouseholdChild(OvcHouseholdChild currentOvcHouseholdChild) {
    _currentOvcHouseholdChild = currentOvcHouseholdChild;
    notifyListeners();
  }
}
