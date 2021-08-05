import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';

class OgacInterventionListState with ChangeNotifier {
  // intitial state
  List<OgacBeneficiary> _ogacInterventionList = <OgacBeneficiary>[];
  bool _isLoading;
  int _numberOfOgac = 0;
  int _numberOfPages = 0;
  int _nextPage = 0;
  String _searchableValue = '';

  PagingController _pagingController;

  bool get isLoading => _isLoading ?? false;

  int get numberOfOgac => _numberOfOgac;

  int get numberOfPages => _numberOfPages;

  PagingController get pagingController => _pagingController;

  void initializePagination() {
    _pagingController = PagingController<int, OgacBeneficiary>(firstPageKey: 0);

    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ovcList = await OgacEnrollmentService()
        .getOgacBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (ovcList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _pagingController, ovcList, pageKey, numberOfPages);
    }
  }

  Future<void> getBeneficiaryNumber() async {
    _numberOfOgac = await OgacEnrollmentService().getOgacBeneficiariesCount();
  }

  Future<void> refreshOgacNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await getBeneficiaryNumber();
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  void searchOgacList(String value) {
    if (_ogacInterventionList.isEmpty) {
      _ogacInterventionList = _pagingController.itemList ?? <OgacBeneficiary>[];
      _nextPage = _pagingController.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshOgacList();
    } else {
      _pagingController.itemList = _ogacInterventionList;
      _pagingController.nextPageKey = _nextPage;

      _ogacInterventionList = <OgacBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    _numberOfOgac = _numberOfOgac + 1;
    getNumberOfPages();
    notifyListeners();
    refreshOgacList();
  }

  //reducers
  Future<void> refreshOgacList() async {
    _isLoading = true;
    notifyListeners();
    await getBeneficiaryNumber();
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  void getNumberOfPages() {
    if (numberOfOgac != null) {
      _numberOfPages =
          (numberOfOgac / PaginationConstants.paginationLimit).ceil();
    }
  }
}
