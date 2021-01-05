import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List<OvcHouseHold> _ovcInterventionList = [];
  List<OvcHouseHold> _filteredOvcInterventionList = [];
  PagingController _pagingController =
      PagingController<int, OvcHouseHold>(firstPageKey: 0);
  bool _isLoading = true;
  int _numberOfHouseHolds = 0;
  int _numberOfOvcs = 0;
  int _pageNumber = 0;
  int _numberOfPages = 0;

  //selectors
  List<OvcHouseHold> get ovcInterventionList =>
      _filteredOvcInterventionList ?? [];

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfHouseHolds => _numberOfHouseHolds;

  int get numberOfOvcs => _numberOfOvcs;

  int get pageNumber => _pageNumber;

  int get numberOfPages => _numberOfPages;

  PagingController get pagingController => _pagingController;

  void initializePagination() {
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    if (pageKey != 0) {
      updatePageNumber(pageKey);
      if (pageKey == (numberOfPages - 1)) {
        _pagingController.appendLastPage(await OvcEnrollmentHouseHoldService()
            .getHouseHoldList(page: _pageNumber));
      } else {
        _pagingController.appendPage(
            await OvcEnrollmentHouseHoldService()
                .getHouseHoldList(page: _pageNumber),
            (pageKey + 1));
      }
    }
  }

  // reducers
  void updateNumerOfOvcBeneficiaries() {
    _isLoading = false;
    searchHouseHold('');
  }

  void searchHouseHold(String value) {
    _filteredOvcInterventionList = value == ''
        ? _ovcInterventionList
        : _ovcInterventionList
            .where((OvcHouseHold beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    // _numberOfHouseHolds = _filteredOvcInterventionList.length;
    for (OvcHouseHold houseHold in _filteredOvcInterventionList) {
      _numberOfOvcs += houseHold.children.length;
    }
    notifyListeners();
  }

  Future<void> refreshOvcNumber() async {
    //write code to count and update number of Households and number of OVC
    _isLoading = true;
    _pageNumber = 0;
    notifyListeners();
    _numberOfHouseHolds =
        await OvcEnrollmentHouseHoldService().getHouseholdCount();
    _numberOfOvcs = 5;
    //Update number of Pages
    if (numberOfHouseHolds != null) {
      _numberOfPages =
          (numberOfHouseHolds / PaginationConstants.paginationLimit).ceil();
    }
    initializePagination();
    await getInitialOvcList();
  }

  void updatePageNumber(int pageNo) async {
    _pageNumber = pageNo;
  }

  Future<void> refreshOvcList() async {
    _isLoading = true;
    // notifyListeners();
    _ovcInterventionList = await OvcEnrollmentHouseHoldService()
        .getHouseHoldList(page: _pageNumber);
    // notifyListeners();
    updateNumerOfOvcBeneficiaries();
  }

  Future<void> getInitialOvcList() async {
    // _isLoading =  true;
    _pagingController.value = PagingState<int, OvcHouseHold>(
        nextPageKey: 1,
        itemList:
            await OvcEnrollmentHouseHoldService().getHouseHoldList(page: 0));
    _isLoading = false;
    notifyListeners();
  }

  Future<void> onHouseHoldAdd() async {
    await refreshOvcNumber();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
