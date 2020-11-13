import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';

class OvcHouseHoldCurrentSelectionState with ChangeNotifier {
  String childHIVStatusId = 'wmKqYZML8GA';
  // initiat state
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

  getCurrrentOvcHouseHoldChildAge() {
    return _currentOvcHouseHoldChild.age ?? _currentOvcHouseHoldChild.age;
  }

 String getCurrrentOvcHouseHoldChildHIVStatus() {
    List<dynamic> attributes = _currentOvcHouseHoldChild.teiData.attributes;
    String childHIVStatus;
    if (attributes.isNotEmpty && attributes.length > 0) {
      for (dynamic attributeObj in attributes) {
        if (attributeObj.containsKey('attribute') &&
            attributeObj['attribute'] == childHIVStatusId && attributeObj.containsKey('value')) {
          childHIVStatus = attributeObj['value'];
        }
      }
    }
    return childHIVStatus;
  }
}
