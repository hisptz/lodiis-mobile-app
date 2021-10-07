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
  int _numberOfLbsePages = 0;
  int? _nextLbsePage = 0;
  String _searchableValue = '';
  PagingController? _lbsePagingController;

  EducationLbseInterventionState(this.context);

  bool get isLoading => _isLoading ?? false;
  int get numberOfEducationLbse => _numberOfEducationLbse;
  int get numberOfPages => _numberOfLbsePages;
  PagingController? get pagingController => _lbsePagingController;

  void _initializePagination() {
    _lbsePagingController =
        PagingController<int, EducationBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _lbsePagingController,
        fetchPage: _fetchLbsePage);
  }

  Future<void> _fetchLbsePage(int pageKey) async {
    String searchableValue = _searchableValue;
    List lbseList = await EducationLbseEnrollmentService()
        .getBeneficiaries(page: pageKey, searchableValue: searchableValue);
    if (lbseList.isEmpty && pageKey < numberOfPages) {
      _fetchLbsePage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
        _lbsePagingController,
        lbseList,
        pageKey,
        numberOfPages,
      );
    }
  }

  Future<void> _getLbseBeneficiariesNumber() async {
    _numberOfEducationLbse =
        await EducationLbseEnrollmentService().getBeneficiariesCount();
    notifyListeners();
  }

  Future<void> refreshEducationLbseNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await _getLbseBeneficiariesNumber();
    getNumberOfPages();
    if (_lbsePagingController == null) {
      _initializePagination();
    } else {
      _lbsePagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void searchEducationLbseList(String value) {
    _searchableValue = value;
    notifyListeners();
    if (_educationLbseInterventionList.isEmpty) {
      _educationLbseInterventionList =
          _lbsePagingController!.itemList as List<EducationBeneficiary>? ??
              <EducationBeneficiary>[];
      _nextLbsePage = _lbsePagingController!.nextPageKey;
    }
    if (value.isNotEmpty) {
      refreshEducationLbseList();
    } else {
      _lbsePagingController!.itemList = _educationLbseInterventionList;
      _lbsePagingController!.nextPageKey = _nextLbsePage;
      _educationLbseInterventionList = <EducationBeneficiary>[];
      _nextLbsePage = 0;
    }
  }

  void onBeneficiaryAdd() {
    refreshEducationLbseList();
  }

  Future<void> refreshEducationLbseList() async {
    _lbsePagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void getNumberOfPages() {
    _numberOfLbsePages =
        (_numberOfEducationLbse / PaginationConstants.paginationLimit).ceil();
    notifyListeners();
  }
}
