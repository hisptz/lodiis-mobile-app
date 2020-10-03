import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List _dreamsInterventionList;
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;

  List<AgywDream> _agywDreamList;

  //selectors
  List get dreamsInterventionList => _dreamsInterventionList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;
  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;
  List<AgywDream> get agywDreamList => _agywDreamList;

  // reducers
  void refreshDreamsList() async {
    _isLoading = true;
    notifyListeners();
    _agywDreamList = await AgywDreamEnrollmentService().getAgywBenficiaryList();
    _isLoading = false;
    _numberOfAgywDreamsBeneficiaries = _agywDreamList.length;
    notifyListeners();
  }
}
