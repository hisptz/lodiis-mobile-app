import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';

class DreamsInterventionListState with ChangeNotifier {
  // intial state
  List<AgywDream> _agywDreamsInterventionList = <AgywDream>[];
  List<AgywDream> _agywDreamsIncomingReferralList = <AgywDream>[];
  List<AgywDream> _noneAgywDreamsInterventionList = <AgywDream>[];
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfAgywDreamsIncomingReferralBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;
  int _agywNumberOfPages = 0;
  int _agywIncomingReferralNumberOfPages = 0;
  int _nonAgywNumberOfPages = 0;
  int _agywNextPage = 0;
  int _agywIncomingReferralNextPage = 0;
  int _nonAgywNextPage = 0;
  String _searchableValue = '';
  bool _isIncomingReferral = false;

  List<String> teiWithIncomingReferral = [
    "'AcHjp6pHOvp'",
    "'aBp0UUHv6vj'",
    "'kvBOB0jj006'",
    "'ZyMXziq9Qto'",
    "'Fcj6O6vBj0O'",
    "'AvHvUjvOvUv'",
    "'fcHBHUOOOcv'",
    "'ajB0B6pOc6c'",
    "'FUHccp60jUO'",
    "'ApHHUcBv6O0'"
  ];

  PagingController _agywPagingController;

  PagingController _agywIncomingReferralPagingController;

  PagingController _nonAgywPagingController;

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;

  int get numberOfAgywDreamsIncomingReferralBeneficiaries =>
      _numberOfAgywDreamsIncomingReferralBeneficiaries;

  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;

  int get agywNumberOfPages => _agywNumberOfPages;

  int get agywIncomingReferralNumberOfPages =>
      _agywIncomingReferralNumberOfPages;

  int get nonAgywNumberOfPages => _nonAgywNumberOfPages;

  PagingController get agywPagingController => getPagingController();

  PagingController get nonAgywPagingController => _nonAgywPagingController;

  PagingController getPagingController() {
    return _isIncomingReferral
        ? _agywIncomingReferralPagingController
        : _agywPagingController;
  }

  Future<void> _fetchAgywPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List<AgywDream> agywList = await AgywDreamEnrollmentService()
        .getAgywBenficiaryList(page: pageKey, searchableValue: searchableValue);
    if (agywList.isEmpty && pageKey < agywNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _agywPagingController, agywList, pageKey, agywNumberOfPages);
    }
  }

  void setReferralStatus({bool isIncomingReferral}) {
    _isIncomingReferral = isIncomingReferral;
  }

  _fetchAgywPagePerIncomingReferral(int pageKey) async {
    List<AgywDream> agywList = await AgywDreamEnrollmentService()
        .getAgywBenficiariesWithIncomingReferralList(
            page: pageKey, teiList: teiWithIncomingReferral);
    if (agywList.isEmpty && pageKey < agywIncomingReferralNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _agywIncomingReferralPagingController,
          agywList,
          pageKey,
          agywIncomingReferralNumberOfPages);
    }
  }

  Future<void> _fetchNonAgywPage(int pageKey) async {
    String searchableValue = _searchableValue;

    List<AgywDream> nonAgywList = await NoneAgywDreamEnrollmentService()
        .getNonAgywBenficiaryList(
            page: pageKey, searchableValue: searchableValue);
    if (nonAgywList.isEmpty && pageKey != agywNumberOfPages) {
      _fetchNonAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _nonAgywPagingController, nonAgywList, pageKey, nonAgywNumberOfPages);
    }
  }

  void initializePagination() {
    _nonAgywPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    _agywPagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    _agywIncomingReferralPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _agywPagingController,
        fetchPage: _fetchAgywPage);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _agywIncomingReferralPagingController,
        fetchPage: _fetchAgywPagePerIncomingReferral);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _nonAgywPagingController,
        fetchPage: _fetchNonAgywPage);
  }

  Future<void> refreshBeneficiariesNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    //write code to count and update number of Beneficiaries
    await getDreamsCount();
    getNumberOfPages();
    if (_nonAgywPagingController == null ||
        _agywPagingController == null ||
        _agywIncomingReferralPagingController == null) {
      initializePagination();
    } else {
      _nonAgywPagingController.refresh();
      _agywPagingController.refresh();
      _agywIncomingReferralPagingController.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getDreamsCount() async {
    _numberOfAgywDreamsBeneficiaries =
        await AgywDreamEnrollmentService().getAgywBeneficiaryCount();
    _numberOfAgywDreamsIncomingReferralBeneficiaries =
        await AgywDreamEnrollmentService()
            .getIncomingReferralAgywBeneficiaryCount(teiWithIncomingReferral);
    _numberOfNoneAgywDreamsBeneficiaries =
        await NoneAgywDreamEnrollmentService().getNonAgywBeneficiaryCount();
  }

  // reducers
  void searchAgywDreams(String value) {
    if (_agywDreamsInterventionList.isEmpty) {
      _agywDreamsInterventionList =
          _agywPagingController.itemList ?? <AgywDream>[];
      _agywNextPage = _agywPagingController.nextPageKey;
    }
    if (_agywDreamsIncomingReferralList.isEmpty) {
      _agywDreamsIncomingReferralList =
          _agywIncomingReferralPagingController.itemList ?? <AgywDream>[];
      _agywIncomingReferralNextPage =
          _agywIncomingReferralPagingController.nextPageKey;
    }
    if (_noneAgywDreamsInterventionList.isEmpty) {
      _noneAgywDreamsInterventionList =
          _nonAgywPagingController.itemList ?? <AgywDream>[];
      _nonAgywNextPage = _nonAgywPagingController.nextPageKey;
    }
    if (value.isNotEmpty) {
      _searchableValue = value;
      notifyListeners();
      refreshDreamsList();
    } else {
      _agywPagingController.itemList = _agywDreamsInterventionList;
      _agywPagingController.nextPageKey = _agywNextPage;
      _agywDreamsInterventionList = <AgywDream>[];
      _agywNextPage = 0;

      _agywIncomingReferralPagingController.itemList =
          _agywDreamsIncomingReferralList;
      _agywIncomingReferralPagingController.nextPageKey =
          _agywIncomingReferralNextPage;
      _agywDreamsIncomingReferralList = <AgywDream>[];
      _agywIncomingReferralNextPage = 0;

      _nonAgywPagingController.itemList = _noneAgywDreamsInterventionList;
      _nonAgywPagingController.nextPageKey = _nonAgywNextPage;
      _noneAgywDreamsInterventionList = <AgywDream>[];
      _nonAgywNextPage = 0;
    }
  }

  void onNonAgywBeneficiaryAdd() {
    _numberOfNoneAgywDreamsBeneficiaries =
        _numberOfNoneAgywDreamsBeneficiaries + 1;
    getNumberOfPages();
    notifyListeners();
    refreshDreamsList();
  }

  void onAgywBeneficiaryAdd() {
    _numberOfAgywDreamsBeneficiaries = _numberOfAgywDreamsBeneficiaries + 1;
    getNumberOfPages();
    notifyListeners();
    refreshDreamsList();
  }

  void refreshDreamsList() async {
    _agywPagingController.refresh();
    _nonAgywPagingController.refresh();
    _agywIncomingReferralPagingController.refresh();
    notifyListeners();
  }

  @override
  void dispose() {
    _agywPagingController.dispose();
    _nonAgywPagingController.dispose();
    _agywIncomingReferralPagingController.dispose();
    super.dispose();
  }

  void getNumberOfPages() {
    _agywNumberOfPages =
        (_numberOfAgywDreamsBeneficiaries / PaginationConstants.paginationLimit)
            .ceil();
    _nonAgywNumberOfPages = (_numberOfNoneAgywDreamsBeneficiaries /
            PaginationConstants.paginationLimit)
        .ceil();
    _agywIncomingReferralNumberOfPages =
        (_numberOfAgywDreamsIncomingReferralBeneficiaries /
                PaginationConstants.paginationLimit)
            .ceil();
  }
}
