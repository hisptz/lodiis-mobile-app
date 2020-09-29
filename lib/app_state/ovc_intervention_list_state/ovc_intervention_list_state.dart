import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List<OvcHouseHold> _ovcInterventionList;
  bool _isLoading = true;
  int _numberOfHouseHolds = 0;
  int _numberOfOvcs = 0;

  //selectors
  List<OvcHouseHold> get ovcInterventionList => _ovcInterventionList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfHouseHolds => _numberOfHouseHolds;
  int get numberOfOvcs => _numberOfOvcs;

  // reducers
  void updateNumerOfOvcBeneficiaries() {
    _numberOfOvcs = 0;
    _numberOfHouseHolds = 0;
    _numberOfHouseHolds = _ovcInterventionList.length;
    _isLoading = false;
    notifyListeners();
    for (OvcHouseHold houseHold in _ovcInterventionList) {
      _numberOfOvcs += houseHold.children.length;
    }

    notifyListeners();
  }

  void refreshOvcList() async {
    _isLoading = true;
    notifyListeners();
    _ovcInterventionList =
        await OvcEnrollmentHouseHoldService().getHouseHoldList();
    notifyListeners();
    updateNumerOfOvcBeneficiaries();
  }
}
