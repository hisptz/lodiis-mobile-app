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
  Map<String, int> _numberOfEducationBursaryBySex = {};
  int _numberOfEducationBursaryWithoutVulnerability = 0;
  int _numberOfBursaryPages = 0;
  int _numberOfBursaryWithoutVulnerabilityPages = 0;
  int _numberOfBursarySearchablePages = 0;
  int _numberOfBursaryWithoutVulnerabilitySearchablePages = 0;
  int? _nextBursaryPage = 0;
  int? _nextBursaryWithoutCriteriaPage = 0;
  Map _bursarySearchedAttributes = {};
  Map _bursaryWithoutVulnerabilitySearchedAttributes = {};
  List<Map<String, dynamic>> _bursaryFilters = [];
  PagingController? _bursaryPagingController;
  PagingController? _bursaryWithoutVulnerabilityPagingController;

  EducationBursaryInterventionState(this.context);

  Map get bursarySearchedAttributes => _bursarySearchedAttributes;
  Map get bursaryWithoutVulnerabilitySearchedAttributes =>
      _bursaryWithoutVulnerabilitySearchedAttributes;
  bool get isLoading => _isLoading ?? false;
  int get numberOfEducationBursary => _numberOfEducationBursary;
  String get numberOfEducationBursaryBySex =>
      '${_numberOfEducationBursaryBySex['male'] ?? 0} Male  ${_numberOfEducationBursaryBySex['female'] ?? 0} Female';
  int get numberOfEducationBursaryWithoutVulnerability =>
      _numberOfEducationBursaryWithoutVulnerability;
  int get numberOfPages => _bursarySearchedAttributes.isEmpty
      ? _numberOfBursaryPages
      : _numberOfBursarySearchablePages;
  int get numberOfBursaryWithoutVulnerabilityPages =>
      _bursaryWithoutVulnerabilitySearchedAttributes.isEmpty
          ? _numberOfBursaryWithoutVulnerabilityPages
          : _numberOfBursaryWithoutVulnerabilitySearchablePages;
  List<Map<String, dynamic>> get bursaryFilters => _bursaryFilters
      .where((Map<String, dynamic> filter) => filter.isNotEmpty)
      .toList();
  PagingController? get pagingController => _bursaryPagingController;
  PagingController? get bursaryWithoutVulnerabilityPagingController =>
      _bursaryWithoutVulnerabilityPagingController;

  void setBursaryFilters(List<Map<String, dynamic>> filters) {
    _bursaryFilters = filters;
    notifyListeners();
    refreshAllEducationBursaryLists();
  }

  void clearBursaryFilters() {
    _bursaryFilters.clear();
    notifyListeners();
    refreshAllEducationBursaryLists();
  }

  int getBursaryFilterCount() {
    return _bursaryFilters.length;
  }

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
    Map searchedDataValues = _bursaryWithoutVulnerabilitySearchedAttributes;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await EducationBursaryEnrollmentService()
            .getBursaryWithoutVulnerabilityCriteria(
                page: pageKey, searchedDataValues: searchedDataValues);
    if (beneficiaryList.isEmpty &&
        pageKey < numberOfBursaryWithoutVulnerabilityPages) {
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
    Map searchedAttributes = _bursarySearchedAttributes;
    List bursaryList = await EducationBursaryEnrollmentService()
        .getBeneficiaries(
            page: pageKey,
            searchedAttributes: searchedAttributes,
            filters: _bursaryFilters);
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
    _numberOfEducationBursaryBySex =
        await EducationBursaryEnrollmentService().getBeneficiariesCountBySex();
    _numberOfEducationBursary =
        await EducationBursaryEnrollmentService().getBeneficiariesCount();
    _numberOfEducationBursaryWithoutVulnerability =
        await EducationBursaryEnrollmentService()
            .getBursaryWithoutVulnerabilityCriteriaCount();
    notifyListeners();
  }

  Future<void> refreshEducationBursaryNumber() async {
    _isLoading = true;
    _bursarySearchedAttributes.clear();
    _bursaryWithoutVulnerabilitySearchedAttributes.clear();
    notifyListeners();
    await _getBursaryBeneficiaryNumber();
    getNumberOfPages();
    if (_bursaryPagingController == null ||
        _bursaryWithoutVulnerabilityPagingController == null) {
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

  // For searching only the bursary
  void searchEducationBursaryList(Map searchedAttributes) {
    _bursarySearchedAttributes = searchedAttributes;
    notifyListeners();
    if (_educationBursaryInterventionList.isEmpty) {
      _educationBursaryInterventionList =
          _bursaryPagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextBursaryPage = _bursaryPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      // _getBursaryBeneficiaryNumber();
      _bursaryPagingController!.refresh();
    } else {
      _bursaryPagingController!.itemList = _educationBursaryInterventionList;
      _bursaryPagingController!.nextPageKey = _nextBursaryPage;
      _educationBursaryInterventionList = <EducationBeneficiary>[];
      _nextBursaryPage = 0;
    }
  }

  void searchAllEducationBursaryLists(Map searchedAttributes) {
    _bursarySearchedAttributes = searchedAttributes;
    _bursaryWithoutVulnerabilitySearchedAttributes = searchedAttributes;
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
      _nextBursaryWithoutCriteriaPage =
          _bursaryWithoutVulnerabilityPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshAllEducationBursaryLists();
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
    refreshAllEducationBursaryLists();
  }

  Future<void> refreshAllEducationBursaryLists() async {
    _getBursaryBeneficiaryNumber();
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
    _numberOfBursarySearchablePages = (_numberOfEducationBursary /
            PaginationConstants.searchingPaginationLimit)
        .ceil();
    _numberOfBursaryWithoutVulnerabilityPages =
        (_numberOfEducationBursaryWithoutVulnerability /
                PaginationConstants.paginationLimit)
            .ceil();
    _numberOfBursaryWithoutVulnerabilitySearchablePages =
        (_numberOfEducationBursaryWithoutVulnerability /
                PaginationConstants.searchingPaginationLimit)
            .ceil();
    notifyListeners();
  }
}
