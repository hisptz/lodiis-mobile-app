import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';
import 'package:provider/provider.dart';

class OgacInterventionListState with ChangeNotifier {
  final BuildContext? context;
  // intitial state
  List<OgacBeneficiary> _ogacInterventionList = <OgacBeneficiary>[];
  bool? _isLoading;
  int _numberOfOgac = 0;
  int _numberOfPages = 0;
  int? _nextPage = 0;
  Map _searchedAttributes = {};
  List<Map<String, dynamic>> _ogacFilters = [];
  PagingController? _ogacPagingController;

  OgacInterventionListState(this.context);

  Map get searchedAttributes => _searchedAttributes;
  bool get isLoading => _isLoading ?? false;
  int get numberOfOgac => _searchedAttributes.isEmpty
      ? _numberOfOgac
      : _ogacPagingController != null
          ? _ogacPagingController!.itemList != null
              ? _ogacPagingController!.itemList!.length
              : 0
          : 0;
  int get numberOfPages => _numberOfPages;
  List<Map<String, dynamic>> get ogacFilters => _ogacFilters
      .where((Map<String, dynamic> filter) => filter.isNotEmpty)
      .toList();
  PagingController? get pagingController => _ogacPagingController;

  void setOgacFilter(List<Map<String, dynamic>> ogacFilters) {
    _ogacFilters = ogacFilters;
    notifyListeners();
    refreshOgacList();
  }

  void clearOgacFilter() {
    _ogacFilters.clear();
    notifyListeners();
    refreshOgacList();
  }

  int getOgacFilterCount() {
    return _ogacFilters.length;
  }

  void initializePagination() {
    _ogacPagingController =
        PagingController<int, OgacBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ogacPagingController,
        fetchPage: _fetchOgacPage);
  }

  Future<void> _fetchOgacPage(int pageKey) async {
    Map searchedAttributes = _searchedAttributes;
    List ogacList = await OgacEnrollmentService().getOgacBeneficiaries(
        page: pageKey,
        searchedAttributes: searchedAttributes,
        filters: _ogacFilters);
    if (ogacList.isEmpty && pageKey < numberOfPages) {
      _fetchOgacPage(pageKey + 1);
    } else {
      if (_searchedAttributes.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _ogacPagingController, ogacList, pageKey, numberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _ogacPagingController,
          ogacList,
        );
      }
    }
    notifyListeners();
  }

  Future<void> _getOgacBeneficiaryNumber() async {
    _numberOfOgac = await OgacEnrollmentService().getOgacBeneficiariesCount();
  }

  Future<void> refreshOgacNumber() async {
    _isLoading = true;
    _searchedAttributes.clear();
    notifyListeners();
    await _getOgacBeneficiaryNumber();
    getNumberOfPages();
    if (_ogacPagingController == null) {
      initializePagination();
    } else {
      _ogacPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchOgacList(Map searchedAttributes) {
    _searchedAttributes = searchedAttributes;
    notifyListeners();
    if (_ogacInterventionList.isEmpty) {
      _ogacInterventionList =
          _ogacPagingController!.itemList as List<OgacBeneficiary>? ??
              <OgacBeneficiary>[];
      _nextPage = _ogacPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshOgacList();
    } else {
      _ogacPagingController!.itemList = _ogacInterventionList;
      _ogacPagingController!.nextPageKey = _nextPage;

      _ogacInterventionList = <OgacBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() async {
    await _getOgacBeneficiaryNumber();
    refreshOgacList();
  }

  //reducers
  Future<void> refreshOgacList() async {
    _ogacPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void getNumberOfPages() {
    _numberOfPages =
        (numberOfOgac / PaginationConstants.paginationLimit).ceil();
    notifyListeners();
  }
}
