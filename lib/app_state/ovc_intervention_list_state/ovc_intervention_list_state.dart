import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // intial state
  List<OvcHouseHold> _ovcInterventionList = <OvcHouseHold>[];
  PagingController _pagingController;
  bool _isLoading = true;
  int _numberOfHouseHolds = 0;
  int _numberOfOvcs = 0;
  int _numberOfPages = 0;
  int _nextPage = 0;
  String _searchableValue = '';

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
    String searchableValue = _searchableValue;
    List ovcList = await OvcEnrollmentHouseHoldService().getHouseHoldList(
            page: pageKey, searchableValue: searchableValue) ??
        [];
    if (ovcList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _pagingController, ovcList, pageKey, numberOfPages);
    }
  }

  // reducers
  void updateNumerOfOvcBeneficiaries() {
    _isLoading = false;
    searchHouseHold('');
  }

  Future<void> getHouseholdCount() async {
    _numberOfHouseHolds =
        await OvcEnrollmentHouseHoldService().getHouseholdCount();
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
  }

  void searchHouseHold(String value) {
    if (_ovcInterventionList.isEmpty) {
      _ovcInterventionList = _pagingController.itemList ?? <OvcHouseHold>[];
      _nextPage = _pagingController.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshOvcList();
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
    await getHouseholdCount();
    //Update number of Pages
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshOvcList() async {
    _pagingController.refresh();
  }

  Future<void> onHouseholdAdd() async {
    _numberOfHouseHolds = _numberOfHouseHolds + 1;
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
    getNumberOfPages();
    notifyListeners();
    refreshOvcList();
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
