import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';

class OgacInterventionListState with ChangeNotifier {
  // intitial state
  List<OgacBeneficiary> _ogacInterventionList;
  List<OgacBeneficiary> _filteredOgacInterventionList;
  bool _isLoading;
  int _numberOfOgac = 0;
  int _pageNumber = 0;
  int _numberOfPages = 0;

  PagingController _pagingController;

  // selectors
  List<OgacBeneficiary> get ogacInterventionList =>
      _filteredOgacInterventionList ?? [];

  bool get isLoading => _isLoading ?? false;

  int get numberOfOgac => _numberOfOgac;

  int get pageNumber => _pageNumber;

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
      updatePageNumber(pageKey);
      List ovcList = await OgacEnrollementservice()
          .getOgacBeneficiaries(page: pageKey);
      PaginationService.assignPagesToController(
          _pagingController, ovcList, pageKey, numberOfPages);

  }

  void updatePageNumber(int pageNo) async {
    _pageNumber = pageNo;
    notifyListeners();
  }

  Future<void> refreshOgacNumber() async {
    //write code to count and update number of Households and number of OVC
    _isLoading = true;
    notifyListeners();
    _numberOfOgac = 1;
    //Update number of Pages
    getNumberOfPages();
    initializePagination();
   _isLoading = false;
   notifyListeners();
  }

  void searchOgacList(String value) {
    _filteredOgacInterventionList = value == ''
        ? _ogacInterventionList
        : _ogacInterventionList
            .where((OgacBeneficiary beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _numberOfOgac = _filteredOgacInterventionList.length;
    notifyListeners();
  }

  //reducers
  void refreshOgacList() async {
    _pagingController.refresh();
  }

  void getNumberOfPages() {
    if (numberOfOgac != null) {
      _numberOfPages =
          (numberOfOgac / PaginationConstants.paginationLimit).ceil();
    }
  }
}
