import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';

class OgacInterventionListState with ChangeNotifier {
  // intitial state
  List<OgacBeneficiary> _ogacInterventionList;
  List<OgacBeneficiary> _filteredOgacInterventionList;
  bool _isLoading;
  int _numberOfOgac = 0;

  // selectors
  List<OgacBeneficiary> get ogacInterventionList =>
      _filteredOgacInterventionList ?? [];
  bool get isLoading => _isLoading ?? false;
  int get numberOfOgac => _numberOfOgac;

  void searchOgacList(String value) {
    _filteredOgacInterventionList = value == ''
        ? _ogacInterventionList
        : _ogacInterventionList
            .where((OgacBeneficiary beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _numberOfOgac = _filteredOgacInterventionList.length;
    notifyListeners();
  }

  //reducers
  void refreshOgacList() async {
    _isLoading = true;
    notifyListeners();
    _ogacInterventionList =
        await OgacEnrollementservice().getOgacBeneficiaries();
    notifyListeners();
    searchOgacList('');
    _isLoading = false;
  }
}
