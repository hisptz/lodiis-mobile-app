import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/services/education_bursary_enrollment_service.dart';
import 'package:provider/provider.dart';

class EducationBursaryInterventionState with ChangeNotifier {
  final BuildContext? context;
  List<EducationBeneficiary> _educationBursaryInterventionList =
      <EducationBeneficiary>[];
  List<NoneParticipationBeneficiary> _educationBursaryWithoutVulnerabilityLit =
      <NoneParticipationBeneficiary>[];
  bool? _isLoading;
  int _numberOfEducationBursary = 0;
  int _numberOfEducationBursaryWithoutVulnerability = 0;
  int _numberOfBursaryPages = 0;
  int _numberOfBursaryWithoutVulnerabilityPages = 0;
  int? _nextBursaryPage = 0;
  int? _nextBursaryWithoutCriteriaPage = 0;
  String _searchableValue = '';
  PagingController? _bursaryPagingController;
  PagingController? _bursaryWithoutVulnerabilityPagingController;

  EducationBursaryInterventionState(this.context);

  bool get isLoading => _isLoading ?? false;
  int get numberOfEducationBursary => _numberOfEducationBursary;
  int get numberOfEducationBursaryWithoutVulnerability =>
      _numberOfEducationBursaryWithoutVulnerability;
  int get numberOfPages => _numberOfBursaryPages;
  int get numberOfBursaryWithoutVulnerabilityPages =>
      _numberOfBursaryWithoutVulnerabilityPages;
  PagingController? get pagingController => _bursaryPagingController;
  PagingController? get bursaryWithoutVulnerabilityPagingController =>
      _bursaryWithoutVulnerabilityPagingController;

  void initializePagination() {
    _bursaryPagingController =
        PagingController<int, EducationBeneficiary>(firstPageKey: 0);
    _bursaryWithoutVulnerabilityPagingController =
        PagingController<int, NoneParticipationBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _bursaryPagingController,
        fetchPage: _fetchBursaryPage);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _bursaryWithoutVulnerabilityPagingController,
        fetchPage: _fetchBursaryWithoutVulnerability);
  }

  Future<void> _fetchBursaryWithoutVulnerability(int pageKey) async {
    String searchableValue = _searchableValue;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await EducationBursaryEnrollmentService()
            .getBursaryWithoutVulnerabilityCriteria(
                page: pageKey, searchableValue: searchableValue);
    if (beneficiaryList.isEmpty && pageKey < numberOfPages) {
      _fetchBursaryWithoutVulnerability(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _bursaryWithoutVulnerabilityPagingController,
        beneficiaryList,
        pageKey,
        numberOfBursaryWithoutVulnerabilityPages,
      );
    }
  }

  Future<void> _fetchBursaryPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List bursaryList = await EducationBursaryEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (bursaryList.isEmpty && pageKey < numberOfPages) {
      _fetchBursaryPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _bursaryPagingController,
        bursaryList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> _getBursaryBeneficiaryNumber() async {
    _numberOfEducationBursary =
        await EducationBursaryEnrollmentService().getBeneficiariesCount();
    _numberOfEducationBursaryWithoutVulnerability =
        await EducationBursaryEnrollmentService()
            .getBursaryWithoutVulnerabilityCriteriaCount();
    notifyListeners();
  }

  Future<void> refreshEducationBursaryNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await _getBursaryBeneficiaryNumber();
    getNumberOfPages();
    if (_bursaryPagingController == null ||
        _bursaryWithoutVulnerabilityPagingController != null) {
      initializePagination();
    } else {
      _bursaryPagingController!.refresh();
      _bursaryWithoutVulnerabilityPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchEducationBursaryList(String value) {
    _searchableValue = value;
    notifyListeners();
    if (_educationBursaryInterventionList.isEmpty) {
      _educationBursaryInterventionList =
          _bursaryPagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextBursaryPage = _bursaryPagingController!.nextPageKey;
    }
    if (_educationBursaryWithoutVulnerabilityLit.isEmpty) {
      _educationBursaryWithoutVulnerabilityLit =
          _bursaryWithoutVulnerabilityPagingController!.itemList
                  as List<NoneParticipationBeneficiary>? ??
              <NoneParticipationBeneficiary>[];
    }
    if (value.isNotEmpty) {
      refreshEducationBursaryList();
    } else {
      _bursaryPagingController!.itemList = _educationBursaryInterventionList;
      _bursaryPagingController!.nextPageKey = _nextBursaryPage;
      _educationBursaryInterventionList = <EducationBeneficiary>[];
      _nextBursaryPage = 0;

      _bursaryWithoutVulnerabilityPagingController!.itemList =
          _educationBursaryWithoutVulnerabilityLit;
      _bursaryWithoutVulnerabilityPagingController!.nextPageKey =
          _nextBursaryWithoutCriteriaPage;
      _educationBursaryWithoutVulnerabilityLit =
          <NoneParticipationBeneficiary>[];
      _nextBursaryWithoutCriteriaPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    refreshEducationBursaryList();
  }

  Future<void> refreshEducationBursaryList() async {
    _bursaryPagingController!.refresh();
    _bursaryWithoutVulnerabilityPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void getNumberOfPages() {
    _numberOfBursaryPages =
        (_numberOfEducationBursary / PaginationConstants.paginationLimit)
            .ceil();
    _numberOfBursaryWithoutVulnerabilityPages =
        (_numberOfEducationBursaryWithoutVulnerability /
                PaginationConstants.paginationLimit)
            .ceil();
    notifyListeners();
  }
}
