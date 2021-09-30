import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/services/education_lbse_enrollment_service.dart';
import 'package:provider/provider.dart';

class EducationLbseInterventionState with ChangeNotifier {
  final BuildContext? context;
  List<EducationBeneficiary> _educationLbseInterventionList =
      <EducationBeneficiary>[];
  bool? _isLoading;
  int _numberOfEducationLbse = 0;
  int _numberOfPages = 0;
  int? _nextPage = 0;
  String _searchableValue = '';

  PagingController? _pagingController;

  EducationLbseInterventionState(this.context);
  bool get isLoading => _isLoading ?? false;

  int get numberOfEducationLbse => _numberOfEducationLbse;

  int get numberOfPages => _numberOfPages;

  PagingController? get pagingController => _pagingController;

  void initializePagination() {
    _pagingController =
        PagingController<int, EducationBeneficiary>(firstPageKey: 0);

    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List lbseList = await EducationLbseEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (lbseList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _pagingController,
        lbseList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> getBeneficiaryNumber() async {
    _numberOfEducationLbse =
        await EducationLbseEnrollmentService().getBeneficiariesCount();
  }

  Future<void> searchEducationLbseNumber() async {
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

  void searchEducationLbseList(String value) {
    if (_educationLbseInterventionList.isEmpty) {
      _educationLbseInterventionList =
          _pagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextPage = _pagingController!.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshEducationLbseList();
    } else {
      _pagingController!.itemList = _educationLbseInterventionList;
      _pagingController!.nextPageKey = _nextPage;
      _educationLbseInterventionList = <EducationBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    _numberOfEducationLbse = _numberOfEducationLbse + 1;
    getNumberOfPages();
    notifyListeners();
    refreshEducationLbseList();
  }

  //reducers
  Future<void> refreshEducationLbseList() async {
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
    if (_numberOfEducationLbse != null) {
      _numberOfPages =
          (_numberOfEducationLbse / PaginationConstants.paginationLimit).ceil();
    }
  }
}
