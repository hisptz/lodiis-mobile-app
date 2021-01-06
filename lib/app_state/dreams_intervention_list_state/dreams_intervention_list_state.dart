import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List<AgywDream> _agywDreamsInterventionList;
  List<AgywDream> _filteredAgywDreamsInterventionList;
  List<AgywDream> _noneAgywDreamsInterventionList;
  List<AgywDream> _filteredNoneAgywDreamsInterventionList;
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;
  int _agywNumberOfPages = 0;
  int _nonAgywNumberOfPages = 0;

  PagingController _agywPagingController;

  PagingController _nonAgywPagingController;

  //selectors
  List<AgywDream> get agywDreamsInterventionList =>
      _filteredAgywDreamsInterventionList ?? [];

  List<AgywDream> get noneAgywDreamsInterventionList =>
      _filteredNoneAgywDreamsInterventionList ?? [];

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;

  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;

  int get agywNumberOfPages => _agywNumberOfPages;

  int get nonAgywNumberOfPages => _nonAgywNumberOfPages;

  PagingController get agywPagingController => _agywPagingController;

  PagingController get nonAgywPagingController => _nonAgywPagingController;


  Future<void> _fetchAgywPage(int pageKey) async {
    List<AgywDream> agywList = await AgywDreamEnrollmentService()
        .getAgywBenficiaryList(page: pageKey);

    PaginationService.assignPagesToController(
        _agywPagingController, agywList, pageKey, agywNumberOfPages);
  }

  Future<void> _fetchNonAgywPage(int pageKey) async {
    List<AgywDream> nonAgywList = await NoneAgywDreamEnrollmentService()
        .getNonAgywBenficiaryList(page: pageKey);
    PaginationService.assignPagesToController(
        _nonAgywPagingController, nonAgywList, pageKey, nonAgywNumberOfPages);
  }

  void initializePagination() {
    _nonAgywPagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    _agywPagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _agywPagingController,
        fetchPage: _fetchAgywPage);

    PaginationService.initializePagination(
        mounted: true,
        pagingController: _nonAgywPagingController,
        fetchPage: _fetchNonAgywPage);
  }

  Future<void> refreshBeneficiariesNumber() async {
    _isLoading = true;
    notifyListeners();
    //write code to count and update number of Beneficiaries
    _numberOfAgywDreamsBeneficiaries = 1;
    _numberOfNoneAgywDreamsBeneficiaries = 1;
    getNumberOfPages();
    initializePagination();
    _isLoading = false;
    notifyListeners();
  }

  // reducers
  void searchAgywDreams(String value) {
    _filteredAgywDreamsInterventionList = value == ''
        ? _agywDreamsInterventionList
        : _agywDreamsInterventionList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _filteredNoneAgywDreamsInterventionList = value == ''
        ? _noneAgywDreamsInterventionList
        : _noneAgywDreamsInterventionList
            .where((AgywDream beneficiary) =>
                beneficiary.searchableValue.indexOf(value) > -1)
            .toList();
    _numberOfAgywDreamsBeneficiaries =
        _filteredAgywDreamsInterventionList.length;
    _numberOfNoneAgywDreamsBeneficiaries =
        _filteredNoneAgywDreamsInterventionList.length;
    notifyListeners();
  }

  void refreshDreamsList() async {
    _agywPagingController.refresh();
    _nonAgywPagingController.refresh();
    notifyListeners();
  }

  @override
  void dispose() {
    _agywPagingController.dispose();
    _nonAgywPagingController.dispose();
    super.dispose();
  }

  void getNumberOfPages() {
    _agywNumberOfPages =
        (_numberOfAgywDreamsBeneficiaries / PaginationConstants.paginationLimit)
            .ceil();
    _nonAgywNumberOfPages = (_numberOfNoneAgywDreamsBeneficiaries /
            PaginationConstants.paginationLimit)
        .ceil();
  }
}
