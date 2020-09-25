import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List<OvcHouseHold> _ovcInterventionList;
  bool _isLoading;
  int _numberOfOvcBeneficiaries = 0;

  //selectors
  List<OvcHouseHold> get ovcInterventionList => _ovcInterventionList ?? [];
  bool get isLoading => _isLoading ?? false;
  int get numberOfOvcBeneficiaries => _numberOfOvcBeneficiaries;

  // reducers
  void updateNumerOfOvcBeneficiaries() {
    _numberOfOvcBeneficiaries = _ovcInterventionList.length;
    for (OvcHouseHold houseHold in _ovcInterventionList) {
      _numberOfOvcBeneficiaries += houseHold.children.length;
    }
    notifyListeners();
  }

  void refreshOvcList() async {
    _isLoading = true;
    notifyListeners();
    _ovcInterventionList =
        await OvcEnrollmentHouseHoldService().getHouseHoldList();
    _isLoading = false;
    notifyListeners();
  }
}
