import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';

class OgacInterventionListState with ChangeNotifier {
  // intitial state
  List<OgacBeneficiary> _ogacInterventionList;
  bool _isLoading;
  int _numberOfOgac = 0;

  // selectors
  List<OgacBeneficiary> get ogacInterventionList => _ogacInterventionList ?? [];
  bool get isLoading => _isLoading ?? false;
  int get numberOfOgac => _numberOfOgac;

  //reducers
  void refreshOgacList() async {
    _isLoading = true;
    notifyListeners();
    _ogacInterventionList =
        await OgacEnrollementservice().getOgacBeneficiaries();
    _numberOfOgac = _ogacInterventionList.length;
    _isLoading = false;
    notifyListeners();
  }
}
