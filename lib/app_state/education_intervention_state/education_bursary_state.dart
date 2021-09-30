import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/services/education_bursary_enrollment_service.dart';
import 'package:provider/provider.dart';

class EducationBursaryInterventionState with ChangeNotifier {
  final BuildContext? context;
  List<EducationBeneficiary> _educationBursaryInterventionList =
      <EducationBeneficiary>[];
  bool? _isLoading;
  int _numberOfEducationBursary = 0;
  int _numberOfPages = 0;
  int? _nextPage = 0;
  String _searchableValue = '';

  PagingController? _pagingController;

  EducationBursaryInterventionState(this.context);
  bool get isLoading => _isLoading ?? false;

  int get numberOfEducationBursary => _numberOfEducationBursary;

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
    //@TODO replacing with service for getting services
    List ovcList = await EducationBursaryEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (ovcList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _pagingController,
        ovcList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> getBeneficiaryNumber() async {
    //@TODO replacing with service for getting services
    _numberOfEducationBursary =
        await EducationBursaryEnrollmentService().getBeneficiariesCount();
  }

  Future<void> searchEducationBursaryNumber() async {
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

  void searchEducationBursaryList(String value) {
    if (_educationBursaryInterventionList.isEmpty) {
      _educationBursaryInterventionList =
          _pagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextPage = _pagingController!.nextPageKey;
    }
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
      refreshEducationBursaryList();
    } else {
      _pagingController!.itemList = _educationBursaryInterventionList;
      _pagingController!.nextPageKey = _nextPage;
      _educationBursaryInterventionList = <EducationBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    _numberOfEducationBursary = _numberOfEducationBursary + 1;
    getNumberOfPages();
    notifyListeners();
    refreshEducationBursaryList();
  }

  //reducers
  Future<void> refreshEducationBursaryList() async {
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
    if (_numberOfEducationBursary != null) {
      _numberOfPages =
          (_numberOfEducationBursary / PaginationConstants.paginationLimit)
              .ceil();
    }
  }
}
