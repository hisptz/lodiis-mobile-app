import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List<AgywDream> _agywDreamsInterventionList;
  List<AgywDream> _filteredAgywDreamsInterventionList;
  List<AgywDream> _noneAgywDreamsInterventionList;
  List<AgywDream> _filteredNoneAgywDreamsInterventionList;
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;

  //selectors
  List<AgywDream> get agywDreamsInterventionList =>
      _filteredAgywDreamsInterventionList ?? [];
  List<AgywDream> get noneAgywDreamsInterventionList =>
      _filteredNoneAgywDreamsInterventionList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;
  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;

  // reducers
  void searchAgywDreams(String value) {
    _filteredAgywDreamsInterventionList = value == ''
        ? _agywDreamsInterventionList
        : _agywDreamsInterventionList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _filteredNoneAgywDreamsInterventionList = value == ''
        ? _noneAgywDreamsInterventionList
        : _noneAgywDreamsInterventionList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _numberOfAgywDreamsBeneficiaries =
        _filteredAgywDreamsInterventionList.length;
    _numberOfNoneAgywDreamsBeneficiaries =
        _filteredNoneAgywDreamsInterventionList.length;
    notifyListeners();
  }

  void refreshDreamsList() async {
    _isLoading = true;
    notifyListeners();
    _agywDreamsInterventionList =
        await AgywDreamEnrollmentService().getAgywBenficiaryList();

    _noneAgywDreamsInterventionList =
        await NoneAgywDreamEnrollmentService().getNonAgywBenficiaryList();

    _isLoading = false;
    searchAgywDreams('');
  }
}
