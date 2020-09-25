import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List _ovcInterventionList;
  bool _isLoading;

  //selectors
  List get ovcInterventionList => _ovcInterventionList ?? [];
  bool get isLoading => _isLoading ?? false;
  // reducers
  void refreshOvcList() async {
    _isLoading = true;
    notifyListeners();
    _ovcInterventionList =
        await OvcEnrollmentHouseHoldService().getHouseHoldList();
    _isLoading = false;
    notifyListeners();
  }
}
