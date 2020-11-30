import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class CurrentUserState with ChangeNotifier {
  // initiat state
  CurrentUser _currentUser;
  String _currentUserLocations;
  bool _canManageDreams;
  bool _canManageOGAC;
  bool _canManageOvc;
  bool _canManageNoneAgyw;
  bool _canManageHivPrevention;
  bool _canManageReferral;
  bool _canManageCLOReferral;
  bool _canManageHts;
  bool _canManageHivReg;
  bool _canManageSrh;
  bool _canManagePrep;
  bool _canManageMSGHIV;
  bool _canManageArtRefill;
  bool _canManageAnc;
  bool _canManageCondom;
  bool _canManageContaraceptives;
  bool _canManagePOSTGBV;
  bool _canManagePEP;

  // selectors
  CurrentUser get currentUser => _currentUser;
  String get currentUserLocations => _currentUserLocations ?? '';
  bool get canManageDreams => _canManageDreams ?? false;
  bool get canManageOGAC => _canManageOGAC ?? false;
  bool get canManageOvc => _canManageOvc ?? false;
  bool get canManageNoneAgyw => _canManageNoneAgyw ?? false;
  bool get canManageHivPrevention => _canManageHivPrevention ?? false;
  bool get canManageReferral => _canManageReferral ?? false;
  bool get canManageCLOReferral => _canManageCLOReferral ?? false;
  bool get canManageHts => _canManageHts ?? false;
  bool get canManageHivReg => _canManageHivReg ?? false;
  bool get canManageSrh => _canManageSrh ?? false;
  bool get canManagePrep => _canManagePrep ?? false;
  bool get canManageAnc => _canManageAnc ?? false;
  bool get canManageArtRefill => _canManageArtRefill ?? false;
  bool get canManageMSGHIV => _canManageMSGHIV ?? false;
  bool get canManageCondom => _canManageCondom ?? false;
  bool get canManageContraceptives => _canManageContaraceptives ?? false;
  bool get canManagePOSTGBV => _canManagePOSTGBV ?? false;
  bool get canManagePEP => _canManagePEP ?? false;

  void updateUserAccessStatus(String implementingPartner) {
    if (implementingPartner == 'Super user') {
      _canManageDreams = true;
      _canManageOGAC = true;
      _canManageOvc = true;
      _canManageNoneAgyw = true;
      _canManageHivPrevention = true;
      _canManageReferral = true;
      _canManageCLOReferral = true;
      _canManageHts = true;
      _canManageHivReg = true;
      _canManageSrh = true;
      _canManagePrep = true;
      _canManagePEP = true;
      _canManageCondom = true;
      _canManageContaraceptives = true;
      _canManageMSGHIV = true;
      _canManageArtRefill = true;
      _canManageAnc = true;
    }
    if (implementingPartner == 'PSI') {
      _canManageDreams = true;
      _canManageSrh = true;
      _canManageReferral = true;
      _canManageHts = true;
      _canManageMSGHIV = true;
      _canManageMSGHIV = true;
      _canManageCondom = true;
      _canManagePEP = true;
    }
    if (implementingPartner == 'EGPAF') {
      _canManageDreams = true;
      _canManageHts = true;
      _canManageReferral = true;
      _canManageArtRefill = true;
      _canManageMSGHIV = true;
      _canManageAnc = true;
      _canManagePOSTGBV = true;
      _canManageContaraceptives = true;
      _canManagePrep = true;
    }
    if (implementingPartner == 'JPHIEGO') {
      _canManageDreams = true;
      _canManageReferral = true;
      _canManagePrep = true;
      _canManageHts = true;
      _canManagePEP = true;
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
      _canManageOGAC = true;
      _canManageNoneAgyw = true;
      _canManageReferral = true;
      _canManageHivPrevention = true;
      _canManageCLOReferral = true;
      _canManagePOSTGBV = true;
      _canManageMSGHIV = true;
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
    setCurrentUserLocation();
  }

  void setCurrentUserLocation() async {
    String locations = '';
    if (_currentUser != null && _currentUser.userOrgUnitIds != null) {
      List<OrganisationUnit> organisationUnits = await OrganisationUnitService()
          .getOrganisationUnits(_currentUser.userOrgUnitIds);
      locations = organisationUnits
          .map((OrganisationUnit organisationUnit) =>
              organisationUnit.name ?? '')
          .toList()
          .join(', ');
    }
    _currentUserLocations = locations;
    notifyListeners();
  }

  void resetUserAccess() {
    _canManageDreams = false;
    _canManageOGAC = false;
    _canManageOvc = false;
    _canManageNoneAgyw = false;
    _canManageHivPrevention = false;
    _canManageReferral = false;
    _canManageCLOReferral = false;
    _canManageHts = false;
    _canManageHivReg = false;
    _canManageSrh = false;
    _canManagePrep = false;
    _canManageMSGHIV = false;
    _canManageArtRefill = false;
    _canManageAnc = false;
    _canManageCondom = false;
    _canManageContaraceptives = false;
    _canManagePOSTGBV = false;
    _canManagePEP = false;
  }
}
