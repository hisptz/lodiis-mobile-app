import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class CurrentUserState with ChangeNotifier {
  // initiat state
  CurrentUser _currentUser;
  bool _canManageDreams;
  bool _canManageOvc;
  bool _canManageHivPrevention;
  bool _canManageReferral;
  bool _canManageCLOReferral;
  bool _canManageHts;
  bool _canManageHivReg;
  bool _canManageSrh;
  bool _canManagePrep;

  // selectors
  CurrentUser get currentUser => _currentUser;
  bool get canManageDreams => _canManageDreams ?? false;
  bool get canManageOvc => _canManageOvc ?? false;
  bool get canManageHivPrevention => _canManageHivPrevention ?? false;
  bool get canManageReferral => _canManageReferral ?? false;
  bool get canManageCLOReferral => _canManageCLOReferral ?? false;
  bool get canManageHts => _canManageHts ?? false;
  bool get canManageHivReg => _canManageHivReg ?? false;
  bool get canManageSrh => _canManageSrh ?? false;
  bool get canManagePrep => _canManagePrep ?? false;

  void updateUserAccessStatus(String implementingPartner) {
    if (implementingPartner == 'PSI') {
      _canManageDreams = true;
      _canManageSrh = true;
      _canManageReferral = true;
      _canManageHts = true;
    }
    if (implementingPartner == 'EGPAF') {
      _canManageDreams = true;
      _canManageHts = true;
      _canManageReferral = true;
      _canManageHivReg = true;
    }
    if (implementingPartner == 'JPHIEGO') {
      _canManageDreams = true;
      _canManageReferral = true;
      _canManagePrep = true;
    }
    if (implementingPartner == 'KB-Case Management') {
      _canManageOvc = true;
      _canManageReferral = true;
      _canManageCLOReferral = true;
    }
    if (implementingPartner == 'KB-AGYW/DREAMS') {
      _canManageDreams = true;
      _canManageReferral = true;
      _canManageHivPrevention = true;
      _canManageCLOReferral = true;
    }
    if (implementingPartner == 'CLO') {
      _canManageOvc = true;
      _canManageDreams = true;
      _canManageReferral = true;
      _canManageCLOReferral = true;
    }
  }

  //reducers
  void setCurrentUser(CurrentUser user) {
    _currentUser = user;
    String implementingPartner = user.implementingPartner;
    updateUserAccessStatus(implementingPartner);
    notifyListeners();
  }
}
