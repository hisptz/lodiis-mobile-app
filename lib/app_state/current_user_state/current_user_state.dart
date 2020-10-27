import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class CurrentUserState with ChangeNotifier {
  // initiat state
  CurrentUser _currentUser;
  bool _canManageDreams;
  bool _canManageOGAC;
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
  bool get canManageOGAC => _canManageOGAC ?? false;
  bool get canManageOvc => _canManageOvc ?? false;
  bool get canManageHivPrevention => _canManageHivPrevention ?? false;
  bool get canManageReferral => _canManageReferral ?? false;
  bool get canManageCLOReferral => _canManageCLOReferral ?? false;
  bool get canManageHts => _canManageHts ?? false;
  bool get canManageHivReg => _canManageHivReg ?? false;
  bool get canManageSrh => _canManageSrh ?? false;
  bool get canManagePrep => _canManagePrep ?? false;

  void updateUserAccessStatus(String implementingPartner) {
    if (implementingPartner == 'Super user') {
      _canManageDreams = true;
      _canManageOGAC = true;
      _canManageOvc = true;
      _canManageHivPrevention = true;
      _canManageReferral = true;
      _canManageCLOReferral = true;
      _canManageHts = true;
      _canManageHivReg = true;
      _canManageSrh = true;
      _canManagePrep = true;
    }
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
      _canManageOGAC = true;
      _canManageReferral = true;
      _canManageCLOReferral = true;
    }
    if (implementingPartner == 'KB-AGYW/DREAMS') {
      _canManageDreams = true;
      _canManageOvc = true;
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
    resetUserAccess();
    _currentUser = user;
    String implementingPartner = user.implementingPartner;
    updateUserAccessStatus(implementingPartner);
    notifyListeners();
  }

  void resetUserAccess() {
    _canManageDreams = false;
    _canManageOGAC = false;
    _canManageOvc = false;
    _canManageHivPrevention = false;
    _canManageReferral = false;
    _canManageCLOReferral = false;
    _canManageHts = false;
    _canManageHivReg = false;
    _canManageSrh = false;
    _canManagePrep = false;
  }
}
