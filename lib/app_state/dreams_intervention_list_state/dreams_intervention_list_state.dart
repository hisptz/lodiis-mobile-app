import 'package:flutter/foundation.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List _dreamsInterventionList;
  bool _isLoading = false;
  int _numberOfDreamsBeneficiaries = 0;

  //selectors
  List get dreamsInterventionList => _dreamsInterventionList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfDreamsBeneficiaries => _numberOfDreamsBeneficiaries;

  // reducers
  void refreshDreamsList() async {}
}
