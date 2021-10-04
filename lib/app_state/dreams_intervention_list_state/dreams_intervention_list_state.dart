import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dreams_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dreams_enrollment_service.dart';
import 'package:provider/provider.dart';

class DreamsInterventionListState with ChangeNotifier {
  final BuildContext? context;
  // initial state
  List<AgywDream> _agywDreamsInterventionList = <AgywDream>[];
  List<AgywDream> _agywDreamsIncomingReferralList = <AgywDream>[];
  List<AgywDream> _noneAgywDreamsInterventionList = <AgywDream>[];
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfAgywDreamsIncomingReferralBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;
  int _numberOfNoneParticipants = 0;
  int _numberOfBeneficiariesWithoutAgywDreamsCriteria = 0;
  int _agywNumberOfPages = 0;
  int _agywIncomingReferralNumberOfPages = 0;
  int _nonAgywNumberOfPages = 0;
  int _noneParticipantsNumberOfPages = 0;
  int _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages = 0;
  int? _agywNextPage = 0;
  int? _agywIncomingReferralNextPage = 0;
  int? _nonAgywNextPage = 0;
  String _searchableValue = '';
  bool? _isIncomingReferral = false;

  List<String> _teiWithIncomingReferral = [];

  PagingController? _agywPagingController;
  PagingController? _agywIncomingReferralPagingController;
  PagingController? _nonAgywPagingController;
  PagingController? _noneParticipantsPagingController;
  PagingController? _beneficiariesWithoutAgywDreamsCriteriaPagingController;

  DreamsInterventionListState(this.context);

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfAgywDreamsBeneficiaries => _numberOfAgywDreamsBeneficiaries;

  int get numberOfAgywDreamsIncomingReferralBeneficiaries =>
      _numberOfAgywDreamsIncomingReferralBeneficiaries;

  int get numberOfNoneAgywDreamsBeneficiaries =>
      _numberOfNoneAgywDreamsBeneficiaries;

  int get numberOfNoneParticipants => _numberOfNoneParticipants;

  int get numberOfBeneficiariesWithoutAgywDreamsCriteria =>
      _numberOfBeneficiariesWithoutAgywDreamsCriteria;

  int get agywNumberOfPages => _agywNumberOfPages;

  int get agywIncomingReferralNumberOfPages =>
      _agywIncomingReferralNumberOfPages;

  int get nonAgywNumberOfPages => _nonAgywNumberOfPages;

  int get noneParticipantsNumberOfPages => _noneParticipantsNumberOfPages;

  int get beneficiariesWithoutAgywDreamsCriteriaNumberOfPages =>
      _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages;

  bool? get isIncomingReferral => _isIncomingReferral;

  PagingController? get agywPagingController => _agywPagingController;

  PagingController? get agywIncomingReferralPagingController =>
      _agywIncomingReferralPagingController;

  PagingController? get noneParticipantsPagingController =>
      _noneParticipantsPagingController;

  PagingController?
      get beneficiariesWithoutAgywDreamsCriteriaPagingController =>
          _beneficiariesWithoutAgywDreamsCriteriaPagingController;

  PagingController? get nonAgywPagingController => _nonAgywPagingController;

  void setTeiWithIncomingReferral(
      {List<String> teiWithIncomingReferral = const []}) {
    _teiWithIncomingReferral = teiWithIncomingReferral;
    refreshAllDreamsLists();
    notifyListeners();
  }

  void setReferralStatus({bool? isIncomingReferral}) {
    _isIncomingReferral = isIncomingReferral;
  }

  Future<void> _fetchAgywPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywBeneficiaryList(
            page: pageKey, searchableValue: searchableValue);
    if (agywList.isEmpty && pageKey < agywNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _agywPagingController, agywList, pageKey, agywNumberOfPages);
    }
  }

  Future<void> _fetchAgywDreamsNoneParticipantsPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await AgywDreamsEnrollmentService().getNoneParticipationBeneficiaryList(
            page: pageKey, searchableValue: searchableValue);
    if (beneficiaryList.isEmpty && pageKey < noneParticipantsNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _noneParticipantsPagingController,
          beneficiaryList,
          pageKey,
          noneParticipantsNumberOfPages);
    }
  }

  Future<void> _fetchBeneficiariesWithoutAgywEnrollmentCriteriaPage(
      int pageKey) async {
    String searchableValue = _searchableValue;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await AgywDreamsEnrollmentService()
            .getBeneficiariesWithoutEnrollmentCriteriaList(
                page: pageKey, searchableValue: searchableValue);
    if (beneficiaryList.isEmpty &&
        pageKey < beneficiariesWithoutAgywDreamsCriteriaNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _beneficiariesWithoutAgywDreamsCriteriaPagingController,
          beneficiaryList,
          pageKey,
          beneficiariesWithoutAgywDreamsCriteriaNumberOfPages);
    }
  }

  _fetchAgywPagePerIncomingReferral(int pageKey) async {
    String searchableValue = _searchableValue;
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywBenficiariesWithIncomingReferralList(
            page: pageKey,
            teiList: _teiWithIncomingReferral,
            searchableValue: searchableValue);
    if (agywList.isEmpty && pageKey < agywIncomingReferralNumberOfPages) {
      _fetchAgywPagePerIncomingReferral(pageKey + 1);
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

    List<AgywDream> nonAgywList = await NoneAgywDreamsEnrollmentService()
        .getNonAgywBeneficiaryList(
            page: pageKey, searchableValue: searchableValue);
    if (nonAgywList.isEmpty && pageKey != agywNumberOfPages) {
      _fetchNonAgywPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _nonAgywPagingController, nonAgywList, pageKey, nonAgywNumberOfPages);
    }
  }

  void initializePagination() async {
    _nonAgywPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    _agywPagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    _agywIncomingReferralPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    _noneParticipantsPagingController =
        PagingController<int, NoneParticipationBeneficiary>(firstPageKey: 0);
    _beneficiariesWithoutAgywDreamsCriteriaPagingController =
        PagingController<int, NoneParticipationBeneficiary>(firstPageKey: 0);
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
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _noneParticipantsPagingController,
        fetchPage: _fetchAgywDreamsNoneParticipantsPage);
    PaginationService.initializePagination(
        mounted: true,
        pagingController:
            _beneficiariesWithoutAgywDreamsCriteriaPagingController,
        fetchPage: _fetchBeneficiariesWithoutAgywEnrollmentCriteriaPage);
  }

  Future<void> refreshBeneficiariesNumber() async {
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await getDreamsCount();
    getNumberOfPages();
    if (_nonAgywPagingController == null ||
        _agywPagingController == null ||
        _agywIncomingReferralPagingController == null ||
        _noneParticipantsPagingController == null ||
        _beneficiariesWithoutAgywDreamsCriteriaPagingController == null) {
      initializePagination();
    } else {
      _nonAgywPagingController!.refresh();
      _agywPagingController!.refresh();
      _agywIncomingReferralPagingController!.refresh();
      _noneParticipantsPagingController!.refresh();
      _beneficiariesWithoutAgywDreamsCriteriaPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getDreamsCount() async {
    _numberOfAgywDreamsBeneficiaries =
        await AgywDreamsEnrollmentService().getAgywBeneficiaryCount();
    _numberOfAgywDreamsIncomingReferralBeneficiaries =
        await AgywDreamsEnrollmentService()
            .getIncomingReferralAgywBeneficiaryCount(_teiWithIncomingReferral);
    _numberOfNoneAgywDreamsBeneficiaries =
        await NoneAgywDreamsEnrollmentService().getNonAgywBeneficiaryCount();
    _numberOfBeneficiariesWithoutAgywDreamsCriteria =
        await AgywDreamsEnrollmentService()
            .getBeneficiariesWithoutEnrollmentCriteriaCount();
    _numberOfNoneParticipants =
        await AgywDreamsEnrollmentService().getNoneParticipationCount();
    notifyListeners();
  }

  // reducers
  void searchAgywDreams(String value) {
    if (_agywDreamsInterventionList.isEmpty) {
      _agywDreamsInterventionList =
          _agywPagingController!.itemList as List<AgywDream>? ?? <AgywDream>[];
      _agywNextPage = _agywPagingController!.nextPageKey;
    }
    if (_agywDreamsIncomingReferralList.isEmpty) {
      _agywDreamsIncomingReferralList =
          _agywIncomingReferralPagingController!.itemList as List<AgywDream>? ??
              <AgywDream>[];
      _agywIncomingReferralNextPage =
          _agywIncomingReferralPagingController!.nextPageKey;
    }
    if (_noneAgywDreamsInterventionList.isEmpty) {
      _noneAgywDreamsInterventionList =
          _nonAgywPagingController!.itemList as List<AgywDream>? ??
              <AgywDream>[];
      _nonAgywNextPage = _nonAgywPagingController!.nextPageKey;
    }
    if (value.isNotEmpty) {
      _searchableValue = value;
      notifyListeners();
      refreshAllDreamsLists();
    } else {
      _agywPagingController!.itemList = _agywDreamsInterventionList;
      _agywPagingController!.nextPageKey = _agywNextPage;
      _agywDreamsInterventionList = <AgywDream>[];
      _agywNextPage = 0;

      _agywIncomingReferralPagingController!.itemList =
          _agywDreamsIncomingReferralList;
      _agywIncomingReferralPagingController!.nextPageKey =
          _agywIncomingReferralNextPage;
      _agywDreamsIncomingReferralList = <AgywDream>[];
      _agywIncomingReferralNextPage = 0;

      _nonAgywPagingController!.itemList = _noneAgywDreamsInterventionList;
      _nonAgywPagingController!.nextPageKey = _nonAgywNextPage;
      _noneAgywDreamsInterventionList = <AgywDream>[];
      _nonAgywNextPage = 0;
    }
  }

  void onNonAgywBeneficiaryAdd() {
    _numberOfNoneAgywDreamsBeneficiaries =
        _numberOfNoneAgywDreamsBeneficiaries + 1;
    getNumberOfPages();
    notifyListeners();
    refreshAllDreamsLists();
  }

  void onAgywBeneficiaryAdd() {
    _numberOfAgywDreamsBeneficiaries = _numberOfAgywDreamsBeneficiaries + 1;
    getNumberOfPages();
    notifyListeners();
    refreshAllDreamsLists();
  }

  void onBeneficiariesWithoutAgywDreamsCriteriaAdd() {
    _numberOfBeneficiariesWithoutAgywDreamsCriteria =
        _numberOfBeneficiariesWithoutAgywDreamsCriteria + 1;
    getNumberOfPages();
    notifyListeners();
    refreshAllDreamsLists();
  }

  void onAgywDreamsNoneParticipantAdd() {
    _numberOfNoneParticipants = _numberOfNoneParticipants + 1;
    getNumberOfPages();
    notifyListeners();
    refreshAllDreamsLists();
  }

  void refreshAllDreamsLists() async {
    _agywPagingController!.refresh();
    _nonAgywPagingController!.refresh();
    _agywIncomingReferralPagingController!.refresh();
    _noneParticipantsPagingController!.refresh();
    _beneficiariesWithoutAgywDreamsCriteriaPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void refreshAgywDreamsList() async {
    _agywPagingController!.refresh();
    notifyListeners();
  }

  void refreshNonAgywDreamsList() async {
    _nonAgywPagingController!.refresh();
    notifyListeners();
  }

  void refreshAgywIncomingReferralDreamsList() async {
    _agywIncomingReferralPagingController!.refresh();
    notifyListeners();
  }

  void refreshNoneParticipantsList() async {
    _noneParticipantsPagingController!.refresh();
    notifyListeners();
  }

  void refreshBeneficiariesWithNoAgywDreamsCriteriaList() async {
    _beneficiariesWithoutAgywDreamsCriteriaPagingController!.refresh();
    notifyListeners();
  }

  @override
  void dispose() {
    _agywPagingController!.dispose();
    _nonAgywPagingController!.dispose();
    _agywIncomingReferralPagingController!.dispose();
    _noneParticipantsPagingController!.dispose();
    _beneficiariesWithoutAgywDreamsCriteriaPagingController!.dispose();
    super.dispose();
  }

  void getNumberOfPages() async {
    await getDreamsCount();
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
    _noneParticipantsNumberOfPages =
        (_numberOfNoneParticipants / PaginationConstants.paginationLimit)
            .ceil();
    _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages =
        (_numberOfBeneficiariesWithoutAgywDreamsCriteria /
                PaginationConstants.paginationLimit)
            .ceil();

    notifyListeners();
  }
}
