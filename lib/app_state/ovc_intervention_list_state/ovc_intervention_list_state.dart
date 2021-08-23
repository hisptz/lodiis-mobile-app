import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';

class OvcInterventionListState with ChangeNotifier {
  // initial state
  List<OvcHousehold> _ovcInterventionList = <OvcHousehold>[];
  PagingController? _pagingController;
  bool _isLoading = true;
  int _numberOfHouseholds = 0;
  int _numberOfOvcs = 0;
  int _numberOfPages = 0;
  int? _nextPage = 0;
  String _searchableValue = '';

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfHouseholds => _numberOfHouseholds;

  int get numberOfOvcs => _numberOfOvcs;

  int get numberOfPages => _numberOfPages;

  PagingController? get pagingController => _pagingController;

  void initializePagination() {
    _pagingController = PagingController<int, OvcHousehold>(
      firstPageKey: 0,
    );
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ovcList = await OvcEnrollmentHouseholdService()
        .getHouseholdList(page: pageKey, searchableValue: searchableValue);
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
    searchHousehold('');
  }

  Future<void> getHouseholdCount() async {
    _numberOfHouseholds =
        await OvcEnrollmentHouseholdService().getHouseholdCount();
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
  }

  void searchHousehold(String value) {
    if (_ovcInterventionList.isEmpty) {
      _ovcInterventionList =
          _pagingController!.itemList as List<OvcHousehold>? ??
              <OvcHousehold>[];
      _nextPage = _pagingController!.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshOvcList();
    } else {
      _pagingController!.itemList = _ovcInterventionList;
      _pagingController!.nextPageKey = _nextPage;

      _ovcInterventionList = <OvcHousehold>[];
      _nextPage = 0;
    }
  }

  Future<void> refreshOvcNumber() async {
    //write code to count and update number of Households and number of OVC
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await getHouseholdCount();
    //Update number of Pages
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshOvcList() async {
    _pagingController!.refresh();
  }

  Future<void> onHouseholdAdd() async {
    _numberOfHouseholds = _numberOfHouseholds + 1;
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
    getNumberOfPages();
    notifyListeners();
    refreshOvcList();
  }

  @override
  void dispose() {
    _pagingController!.dispose();
    super.dispose();
  }

  void getNumberOfPages() {
    if (numberOfHouseholds != null) {
      _numberOfPages =
          (numberOfHouseholds / PaginationConstants.paginationLimit).ceil();
    }
  }
}
