import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/models/Non_Agyw_Prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/service/non_agyw_prep_service.dart';

class NonAgywPrepListState with ChangeNotifier {
  // intial state

  List<PrepVisit> _noneAgywPrepList;
  bool _isLoading = false;

  //selectors
  List<PrepVisit> get noneAgywPrepList => _noneAgywPrepList ?? [];
  bool get isLoading => _isLoading != null ? _isLoading : false;

  // reducers
  void refreshDreamsList() async {
    _isLoading = true;
    notifyListeners();
    _noneAgywPrepList = await NonAgywPrepService().getANonAgywPrepVisit();
    _isLoading = false;
    print("data");
    print(_noneAgywPrepList);
  }

//getNonAgywBenficiaryList

}
