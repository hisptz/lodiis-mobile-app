import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';

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

  Future<void> refetchCurrentHousehold() async {
    OvcHousehold? ovcHousehold = await OvcEnrollmentHouseholdService()
        .getSelectedHousehold(currentOvcHousehold!.id ?? '');
    if (ovcHousehold != null) {
      setCurrentHousehold(ovcHousehold);
      if (currentOvcHouseholdChild != null) {
        var currentChild = (ovcHousehold.children ?? []).firstWhere(
            (ovc) => ovc.id == currentOvcHouseholdChild!.id,
            orElse: () => currentOvcHouseholdChild!);
        setCurrentHouseholdChild(currentChild);
      }
    }
  }

  void setCurrentHouseholdChild(OvcHouseholdChild currentOvcHouseholdChild) {
    _currentOvcHouseholdChild = currentOvcHouseholdChild;
    notifyListeners();
  }
}
