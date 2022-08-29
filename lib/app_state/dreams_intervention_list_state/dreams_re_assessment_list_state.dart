import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dreams_enrollment_service.dart';

class DreamsRaAssessmentListState extends ChangeNotifier {
  // Initial state
  List<AgywDream> _dreamsReAssessmentList = <AgywDream>[];
  bool? _isLoading;
  int _numberOfDreamsToReAssess = 0;
  int _numberOfPages = 0;
  int? _nextPage = 0;
  String _searchedAttributes = '';
  PagingController? _pagingController;

  // Getters
  bool get isLoading => _isLoading ?? false;
  PagingController? get pagingController => _pagingController;
  int get numberOfDreamsToReAssess => _numberOfDreamsToReAssess;
  int get numberOfPages => _numberOfPages;

  // Reducers

  void getNumberOfPages() {
    _numberOfPages =
        (_numberOfDreamsToReAssess / PaginationConstants.paginationLimit)
            .ceil();
    notifyListeners();
  }

  void initializePagination() {
    _pagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywDreamsToReAssess(pageKey,
            searchableAttribute: _searchedAttributes);
    if (agywList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _pagingController, agywList, pageKey, numberOfPages);
      notifyListeners();
    }
  }

  Future<void> refreshBeneficiariesNumber() async {
    _updateLoadingState(true);
    await getReAssessmentBeneficiaryCount();
    getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController!.refresh();
    }
    _updateLoadingState(false);
  }

  void searchDreamsReAssessmentBeneficiaries(
    String searchedAttributes,
  ) {
    _searchedAttributes = searchedAttributes;
    notifyListeners();
    if (_dreamsReAssessmentList.isEmpty) {
      _dreamsReAssessmentList =
          _pagingController!.itemList as List<AgywDream>? ?? <AgywDream>[];
      _nextPage = _pagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshList();
    } else {
      _pagingController!.itemList = _dreamsReAssessmentList;
      _pagingController!.nextPageKey = _nextPage;

      _dreamsReAssessmentList = <AgywDream>[];
      _nextPage = 0;
    }
  }

  Future<void> getReAssessmentBeneficiaryCount() async {
    _numberOfDreamsToReAssess = await AgywDreamsEnrollmentService()
        .getCountOfAgywBeneficiaryForReAssessment();
    notifyListeners();
  }

  Future<void> refreshList() async {
    _pagingController!.refresh();
    notifyListeners();
  }

  void _updateLoadingState(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
