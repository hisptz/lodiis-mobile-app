import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List<OvcHouseHold> _ovcInterventionList = <OvcHouseHold>[];
  List<OvcHouseHold> _filteredOvcInterventionList = [];
  PagingController _pagingController;
  bool _isLoading = true;
  int _numberOfHouseHolds = 0;
  int _numberOfOvcs = 0;
  int _numberOfPages = 0;
  int _nextPage = 0;
  String searchText = '';

  //selectors
  List<OvcHouseHold> get ovcInterventionList =>
      _filteredOvcInterventionList ?? [];

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfHouseHolds => _numberOfHouseHolds;

  int get numberOfOvcs => _numberOfOvcs;

  int get numberOfPages => _numberOfPages;

  PagingController get pagingController => _pagingController;

  void initializePagination() {
    _pagingController = PagingController<int, OvcHouseHold>(
      firstPageKey: 0,
    );
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    List ovcList =
        await OvcEnrollmentHouseHoldService().getHouseHoldList(page: pageKey) ??
            [];
    PaginationService.assignPagesToController(
        _pagingController, ovcList, pageKey, numberOfPages);
  }

  // reducers
  void updateNumerOfOvcBeneficiaries() {
    _isLoading = false;
    searchHouseHold('');
  }

  void searchHouseHold(String value) {
    if (_ovcInterventionList.isEmpty) {
      _ovcInterventionList = _pagingController.itemList ?? <OvcHouseHold>[];
      _nextPage = _pagingController.nextPageKey;
    }
    if (value != '') {
      final filteredHouseholds = _ovcInterventionList
          .where((OvcHouseHold beneficiary) =>
              beneficiary.searchableValue.indexOf(value.toLowerCase()) > -1)
          .toList();
      _pagingController.itemList = filteredHouseholds;
      //Preventing the controller from loading.
      _pagingController.nextPageKey = null;
    } else {
      _pagingController.itemList = _ovcInterventionList;
      _pagingController.nextPageKey = _nextPage;

      _ovcInterventionList = <OvcHouseHold>[];
      _nextPage = 0;
    }
  }

  Future<void> refreshOvcNumber() async {
    //write code to count and update number of Households and number of OVC
    _isLoading = true;
    notifyListeners();
    _numberOfHouseHolds =
        await OvcEnrollmentHouseHoldService().getHouseholdCount();
    _numberOfOvcs = 5;
    //Update number of Pages
    getNumberOfPages();
    initializePagination();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshOvcList() async {
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void getNumberOfPages() {
    if (numberOfHouseHolds != null) {
      _numberOfPages =
          (numberOfHouseHolds / PaginationConstants.paginationLimit).ceil();
    }
  }
}
