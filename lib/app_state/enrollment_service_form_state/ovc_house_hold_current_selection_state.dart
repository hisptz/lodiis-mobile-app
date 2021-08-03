import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';

class OvcHouseHoldCurrentSelectionState with ChangeNotifier {
  // initiate state
  OvcHouseHold _currentOvcHouseHold;
  OvcHouseHoldChild _currentOvcHouseHoldChild;

  // selectors
  OvcHouseHold get currentOvcHouseHold => _currentOvcHouseHold;
  OvcHouseHoldChild get currentOvcHouseHoldChild => _currentOvcHouseHoldChild;

  //reducers
  void setCurrentHouseHold(OvcHouseHold currentOvcHouseHold) {
    _currentOvcHouseHold = currentOvcHouseHold;
    notifyListeners();
  }

  void setCurrentHouseHoldChild(OvcHouseHoldChild currentOvcHouseHoldChild) {
    _currentOvcHouseHoldChild = currentOvcHouseHoldChild;
    notifyListeners();
  }
}
