import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/services/pp_prev_enrollment_service.dart';
import 'package:provider/provider.dart';

class PpPrevInterventionState with ChangeNotifier {
  final BuildContext? context;
  List<PpPrevBeneficiary> _ppPrevInterventionList = <PpPrevBeneficiary>[];
  bool? _isLoading;
  int _numberOfPpPrev = 0;
  int _numberOfPages = 0;
  int _numberOfSearchablePages = 0;
  int? _nextPage = 0;
  String _searchableValue = '';
  List<Map<String, dynamic>> _ppPrevFilters = [];
  PagingController? _ppPrevPagingController;

  PpPrevInterventionState(this.context);

  bool get isLoading => _isLoading ?? false;
  int get numberOfPpPrev => _numberOfPpPrev;
  int get numberOfPages =>
      _searchableValue == '' ? _numberOfPages : _numberOfSearchablePages;
  PagingController? get pagingController => _ppPrevPagingController;

  void setPpPrevFilters(List<Map<String, dynamic>> filters) {
    _ppPrevFilters = filters;
    notifyListeners();
    refreshPpPrevList();
  }

  void clearPpPrevFilters() {
    _ppPrevFilters = [];
    notifyListeners();
    refreshPpPrevList();
  }

  int getPpPrevFilterCount() {
    return _ppPrevFilters.length;
  }

  void initializePagination() {
    _ppPrevPagingController =
        PagingController<int, PpPrevBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ppPrevPagingController,
        fetchPage: _fetchPpPrevPage);
  }

  Future<void> _fetchPpPrevPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ppPrevList = await PpPrevEnrollmentService().getBeneficiaries(
        page: pageKey,
        searchableValue: searchableValue,
        filters: _ppPrevFilters);
    if (ppPrevList.isEmpty && pageKey < numberOfPages) {
      _fetchPpPrevPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _ppPrevPagingController,
        ppPrevList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> _getPpPrevBeneficiaryNumber() async {
    _numberOfPpPrev = await PpPrevEnrollmentService().getBeneficiariesCount();
    notifyListeners();
  }

  Future<void> refreshPpPrevNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await _getPpPrevBeneficiaryNumber();
    getNumberOfPages();
    if (_ppPrevPagingController == null) {
      initializePagination();
    } else {
      _ppPrevPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchPpPrevList(String value) {
    _searchableValue = value;
    notifyListeners();
    if (_ppPrevInterventionList.isEmpty) {
      _ppPrevInterventionList =
          _ppPrevPagingController!.itemList as List<PpPrevBeneficiary>? ??
              <PpPrevBeneficiary>[];
      _nextPage = _ppPrevPagingController!.nextPageKey;
    }
    if (value != '') {
      refreshPpPrevList();
    } else {
      _ppPrevPagingController!.itemList = _ppPrevInterventionList;
      _ppPrevPagingController!.nextPageKey = _nextPage;
      _ppPrevInterventionList = <PpPrevBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() async {
    await _getPpPrevBeneficiaryNumber();
    refreshPpPrevList();
  }

  Future<void> refreshPpPrevList() async {
    _ppPrevPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void getNumberOfPages() {
    _numberOfPages =
        (_numberOfPpPrev / PaginationConstants.paginationLimit).ceil();
    _numberOfSearchablePages =
        (_numberOfPpPrev / PaginationConstants.searchingPaginationLimit).ceil();
    notifyListeners();
  }
}
