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
  int? _nextPage = 0;
  String _searchableValue = '';

  PagingController? _pagingController;

  PpPrevInterventionState(this.context);
  bool get isLoading => _isLoading ?? false;

  int get numberOfPpPrev => _numberOfPpPrev;

  int get numberOfPages => _numberOfPages;

  PagingController? get pagingController => _pagingController;

  void initializePagination() {
    _pagingController =
        PagingController<int, PpPrevBeneficiary>(firstPageKey: 0);

    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ppPrevList = await PpPrevEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (ppPrevList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _pagingController,
        ppPrevList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> getBeneficiaryNumber() async {
    _numberOfPpPrev = await PpPrevEnrollmentService().getBeneficiariesCount();
  }

  Future<void> searchPpPrevNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await getBeneficiaryNumber();
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchPpPrevList(String value) {
    if (_ppPrevInterventionList.isEmpty) {
      _ppPrevInterventionList =
          _pagingController!.itemList as List<PpPrevBeneficiary>? ??
              <PpPrevBeneficiary>[];
      _nextPage = _pagingController!.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshPpPrevList();
    } else {
      _pagingController!.itemList = _ppPrevInterventionList;
      _pagingController!.nextPageKey = _nextPage;

      _ppPrevInterventionList = <PpPrevBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    _numberOfPpPrev = _numberOfPpPrev + 1;
    getNumberOfPages();
    notifyListeners();
    refreshPpPrevList();
  }

  //reducers
  Future<void> refreshPpPrevList() async {
    _isLoading = true;
    notifyListeners();
    await getBeneficiaryNumber();
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  void getNumberOfPages() {
    if (_numberOfPpPrev != null) {
      _numberOfPages =
          (_numberOfPpPrev / PaginationConstants.paginationLimit).ceil();
    }
  }
}
