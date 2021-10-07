import 'package:flutter/foundation.dart';
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
  String _searchableValue = '';
  PagingController? _ogacPagingController;

  OgacInterventionListState(this.context);

  bool get isLoading => _isLoading ?? false;
  int get numberOfOgac => _numberOfOgac;
  int get numberOfPages => _numberOfPages;
  PagingController? get pagingController => _ogacPagingController;

  void initializePagination() {
    _ogacPagingController =
        PagingController<int, OgacBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ogacPagingController,
        fetchPage: _fetchOgacPage);
  }

  Future<void> _fetchOgacPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ogacList = await OgacEnrollmentService()
        .getOgacBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (ogacList.isEmpty && pageKey < numberOfPages) {
      _fetchOgacPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _ogacPagingController, ogacList, pageKey, numberOfPages);
    }
  }

  Future<void> _getOgacBeneficiaryNumber() async {
    _numberOfOgac = await OgacEnrollmentService().getOgacBeneficiariesCount();
  }

  Future<void> refreshOgacNumber() async {
    _isLoading = true;
    _searchableValue = '';
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

  void searchOgacList(String value) {
    _searchableValue = value;
    notifyListeners();
    if (_ogacInterventionList.isEmpty) {
      _ogacInterventionList =
          _ogacPagingController!.itemList as List<OgacBeneficiary>? ??
              <OgacBeneficiary>[];
      _nextPage = _ogacPagingController!.nextPageKey;
    }
    if (value != '') {
      refreshOgacList();
    } else {
      _ogacPagingController!.itemList = _ogacInterventionList;
      _ogacPagingController!.nextPageKey = _nextPage;

      _ogacInterventionList = <OgacBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    refreshOgacList();
  }

  //reducers
  Future<void> refreshOgacList() async {
    _isLoading = true;
    notifyListeners();
    await _getOgacBeneficiaryNumber();
    getNumberOfPages();
    if (_ogacPagingController == null) {
      initializePagination();
    } else {
      _ogacPagingController!.refresh();
    }
    _isLoading = false;
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
