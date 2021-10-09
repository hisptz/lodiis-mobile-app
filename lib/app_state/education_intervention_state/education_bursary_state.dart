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
  PagingController? _bursaryPagingController;
  PagingController? _bursaryWithoutVulnerabilityPagingController;

  EducationBursaryInterventionState(this.context);

  bool get isLoading => _isLoading ?? false;
  int get numberOfEducationBursary => _numberOfEducationBursary;
  int get numberOfPages => _numberOfPages;
  PagingController? get pagingController => _bursaryPagingController;
  PagingController? get bursaryWithoutVulnerabilityPagingController =>
      _bursaryWithoutVulnerabilityPagingController;

  void initializePagination() {
    _bursaryPagingController =
        PagingController<int, EducationBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _bursaryPagingController,
        fetchPage: _fetchBursaryPage);
  }

  Future<void> _fetchBursaryPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List bursaryList = await EducationBursaryEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (bursaryList.isEmpty && pageKey < numberOfPages) {
      _fetchBursaryPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _bursaryPagingController,
        bursaryList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> _getBursaryBeneficiaryNumber() async {
    _numberOfEducationBursary =
        await EducationBursaryEnrollmentService().getBeneficiariesCount();
    notifyListeners();
  }

  Future<void> refreshEducationBursaryNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await _getBursaryBeneficiaryNumber();
    getNumberOfPages();
    if (_bursaryPagingController == null) {
      initializePagination();
    } else {
      _bursaryPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchEducationBursaryList(String value) {
    _searchableValue = value;
    notifyListeners();
    if (_educationBursaryInterventionList.isEmpty) {
      _educationBursaryInterventionList =
          _bursaryPagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextPage = _bursaryPagingController!.nextPageKey;
    }
    if (value.isNotEmpty) {
      refreshEducationBursaryList();
    } else {
      _bursaryPagingController!.itemList = _educationBursaryInterventionList;
      _bursaryPagingController!.nextPageKey = _nextPage;
      _educationBursaryInterventionList = <EducationBeneficiary>[];
      _nextPage = 0;
    }
  }

  void onBeneficiaryAdd() {
    refreshEducationBursaryList();
  }

  Future<void> refreshEducationBursaryList() async {
    _bursaryPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void getNumberOfPages() {
    _numberOfPages =
        (_numberOfEducationBursary / PaginationConstants.paginationLimit)
            .ceil();
    notifyListeners();
  }
}
