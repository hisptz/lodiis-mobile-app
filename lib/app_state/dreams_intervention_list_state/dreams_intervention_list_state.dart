import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List<AgywDream> _agywDreamsInterventionList;
  List _noneAgywDreamsInterventionList;
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;

  //selectors
  List get agywDreamsInterventionList => _agywDreamsInterventionList ?? [];
  List get noneAgywDreamsInterventionList =>
      _noneAgywDreamsInterventionList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;
  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;

  // reducers
  void refreshDreamsList() async {
    _isLoading = true;
    notifyListeners();
    _agywDreamsInterventionList =
        await AgywDreamEnrollmentService().getAgywBenficiaryList();
    _isLoading = false;
    _numberOfAgywDreamsBeneficiaries = _agywDreamsInterventionList.length;
    notifyListeners();
  }
}
