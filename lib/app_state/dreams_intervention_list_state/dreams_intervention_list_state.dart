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
  List<NoneParticipationBeneficiary> _noneParticipationBeneficiaryList =
      <NoneParticipationBeneficiary>[];
  List<NoneParticipationBeneficiary> _unenrolledDreamsBeneficiaryList =
      <NoneParticipationBeneficiary>[];
  List<NoneParticipationBeneficiary> _eligibleNotEnrollBeneficiaryList =
      <NoneParticipationBeneficiary>[];
  bool _isLoading = false;
  int _numberOfAgywDreamsBeneficiaries = 0;
  int _numberOfAgywDreamsIncomingReferralBeneficiaries = 0;
  int _numberOfNoneAgywDreamsBeneficiaries = 0;
  int _numberOfNoneParticipants = 0;
  int _numberOfEnrolledNotEligibleParticipant = 0;
  int _numberOfBeneficiariesWithoutAgywDreamsCriteria = 0;
  int _agywNumberOfPages = 0;
  int _agywIncomingReferralNumberOfPages = 0;
  int _nonAgywNumberOfPages = 0;
  int _noneParticipantsNumberOfPages = 0;
  int _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages = 0;
  int _agywNumberOfSearchablePages = 0;
  int _agywIncomingReferralNumberOfSearchablePages = 0;
  int _nonAgywNumberOfSearchablePages = 0;
  int _noneParticipantsNumberOfSearchablePages = 0;
  int _beneficiariesWithoutAgywDreamsCriteriaNumberOfSearchablePages = 0;
  int? _agywNextPage = 0;
  int? _agywIncomingReferralNextPage = 0;
  int? _nonAgywNextPage = 0;
  int? _noneParticipantsNextPage = 0;
  int _enrolledNotEligibleParticipantsNumberOfPages = 0;
  int? _beneficiariesWithoutAgywDreamsCriteriaNextPage = 0;
  int? _eligibleNotEnrolledNextPage = 0;
  Map _noneEnrolledSearchableValue = {};
  Map _agywSearchableValue = {};
  Map _nonAgywSearchableValue = {};
  Map _agywNoneParticipantSearchedAttributes = {};
  Map _incomingReferralsSearchableValue = {};
  Map _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes = {};
  bool? _isIncomingReferral = false;
  List<String> _teiWithIncomingReferral = [];
  List<Map<String, dynamic>> _agywFilters = [];
  PagingController? _agywPagingController;
  PagingController? _agywIncomingReferralPagingController;
  PagingController? _nonAgywPagingController;
  PagingController? _noneParticipantsPagingController;
  PagingController? _enrolledNotEligibleParticipantPagingController;
  PagingController? _beneficiariesWithoutAgywDreamsCriteriaPagingController;

  DreamsInterventionListState(this.context);

  Map get agywSearchableValue => _agywSearchableValue;
  Map get nonAgywSearchableValue => _nonAgywSearchableValue;
  Map get incomingReferralsSearchableValue => _incomingReferralsSearchableValue;
  Map get beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes =>
      _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes;
  Map get noneEnrolledSearchableValue => _noneEnrolledSearchableValue;
  bool get isLoading => _isLoading;
  int get numberOfAgywDreamsBeneficiaries => _agywSearchableValue.isEmpty
      ? _numberOfAgywDreamsBeneficiaries
      : _agywPagingController != null
          ? _agywPagingController!.itemList != null
              ? _agywPagingController!.itemList!.length
              : 0
          : 0;
  int get numberOfAgywDreamsIncomingReferralBeneficiaries =>
      _incomingReferralsSearchableValue.isEmpty
          ? _numberOfAgywDreamsIncomingReferralBeneficiaries
          : _agywIncomingReferralPagingController != null
              ? _agywIncomingReferralPagingController!.itemList != null
                  ? _agywIncomingReferralPagingController!.itemList!.length
                  : 0
              : 0;
  int get numberOfNoneAgywDreamsBeneficiaries => _nonAgywSearchableValue.isEmpty
      ? _numberOfNoneAgywDreamsBeneficiaries
      : _nonAgywPagingController != null
          ? _nonAgywPagingController!.itemList != null
              ? _nonAgywPagingController!.itemList!.length
              : 0
          : 0;
  int get numberOfNoneParticipants =>
      _agywNoneParticipantSearchedAttributes.isEmpty
          ? _numberOfNoneParticipants
          : _noneParticipantsPagingController != null
              ? _noneParticipantsPagingController!.itemList != null
                  ? _noneParticipantsPagingController!.itemList!.length
                  : 0
              : 0;
  int get numberOfEnrolledNotEligibleParticipant => _noneEnrolledSearchableValue
          .isEmpty
      ? _numberOfEnrolledNotEligibleParticipant
      : _enrolledNotEligibleParticipantPagingController != null
          ? _enrolledNotEligibleParticipantPagingController!.itemList != null
              ? _enrolledNotEligibleParticipantPagingController!
                  .itemList!.length
              : 0
          : 0;
  int get numberOfBeneficiariesWithoutAgywDreamsCriteria =>
      _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes.isEmpty
          ? _numberOfBeneficiariesWithoutAgywDreamsCriteria
          : _beneficiariesWithoutAgywDreamsCriteriaPagingController != null
              ? _beneficiariesWithoutAgywDreamsCriteriaPagingController!
                          .itemList !=
                      null
                  ? _beneficiariesWithoutAgywDreamsCriteriaPagingController!
                      .itemList!.length
                  : 0
              : 0;

  int get agywNumberOfPages =>
      _agywSearchableValue.isEmpty && _agywSearchableValue.isEmpty
          ? _agywNumberOfPages
          : _agywNumberOfSearchablePages;
  int get agywIncomingReferralNumberOfPages =>
      _incomingReferralsSearchableValue.isEmpty &&
              _incomingReferralsSearchableValue.isEmpty
          ? _agywIncomingReferralNumberOfPages
          : _agywIncomingReferralNumberOfSearchablePages;
  int get nonAgywNumberOfPages =>
      _nonAgywSearchableValue.isEmpty && _nonAgywSearchableValue.isEmpty
          ? _nonAgywNumberOfPages
          : _nonAgywNumberOfSearchablePages;
  int get noneParticipantsNumberOfPages =>
      _agywNoneParticipantSearchedAttributes.isEmpty
          ? _noneParticipantsNumberOfPages
          : _noneParticipantsNumberOfSearchablePages;
  int get beneficiariesWithoutAgywDreamsCriteriaNumberOfPages =>
      _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes.isEmpty
          ? _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages
          : _beneficiariesWithoutAgywDreamsCriteriaNumberOfSearchablePages;
  bool? get isIncomingReferral => _isIncomingReferral;
  List<Map<String, dynamic>> get agywFilters => _agywFilters
      .where((Map<String, dynamic> filter) => filter.isNotEmpty)
      .toList();
  PagingController? get agywPagingController => _agywPagingController;
  PagingController? get agywIncomingReferralPagingController =>
      _agywIncomingReferralPagingController;
  PagingController? get noneParticipantsPagingController =>
      _noneParticipantsPagingController;
  PagingController? get enrolledNotEligibleParticipantPagingController =>
      _enrolledNotEligibleParticipantPagingController;
  int get enrolledNotEligibleParticipantsNumberOfPages =>
      _noneEnrolledSearchableValue.isEmpty
          ? _enrolledNotEligibleParticipantsNumberOfPages
          : _noneParticipantsNumberOfSearchablePages;
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

  void setAgywFilters(List<Map<String, dynamic>> agywFilters) {
    _agywFilters = agywFilters;
    refreshAllDreamsLists();
    notifyListeners();
  }

  int getAgywFiltersCount() {
    return _agywFilters.length;
  }

  void clearAllDreamsFilters() {
    _agywFilters = [];
    refreshAllDreamsLists();
    notifyListeners();
  }

  Future<void> _fetchAgywPage(int pageKey) async {
    Map searchableValue = _agywSearchableValue;
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywBeneficiaryList(
            page: pageKey,
            searchedAttributes: searchableValue,
            filters: _agywFilters);
    if (agywList.isEmpty && pageKey < agywNumberOfPages) {
      _fetchAgywPage(pageKey + 1);
    } else {
      if (_agywSearchableValue.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _agywPagingController, agywList, pageKey, agywNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _agywPagingController,
          agywList,
        );
      }
    }
    notifyListeners();
  }

  Future<void> _fetchAgywDreamsNoneParticipantsPage(int pageKey) async {
    Map searchedDataValues = _agywNoneParticipantSearchedAttributes;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await AgywDreamsEnrollmentService().getNoneParticipationBeneficiaryList(
            page: pageKey, searchedDataValues: searchedDataValues);
    if (beneficiaryList.isEmpty && pageKey < noneParticipantsNumberOfPages) {
      _fetchAgywDreamsNoneParticipantsPage(pageKey + 1);
    } else {
      if (_agywNoneParticipantSearchedAttributes.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _noneParticipantsPagingController,
            beneficiaryList,
            pageKey,
            noneParticipantsNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _noneParticipantsPagingController,
          beneficiaryList,
        );
      }
    }
    notifyListeners();
  }

  Future<void> _fetchAgyWDreamsEnrolledNotEligible(int pageKey) async {
    Map searchableValue = _noneEnrolledSearchableValue;
    List<NoneParticipationBeneficiary> beneficiaryList =
        (await AgywDreamsEnrollmentService()
            .getEnrolledNotEligibleParticipationBeneficiaryList(
      page: pageKey,
      searchedDataValues: searchableValue,
    ));
    if (beneficiaryList.isEmpty &&
        pageKey < enrolledNotEligibleParticipantsNumberOfPages) {
      _fetchAgyWDreamsEnrolledNotEligible(pageKey + 1);
    } else {
      if (_noneEnrolledSearchableValue.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _enrolledNotEligibleParticipantPagingController,
            beneficiaryList,
            pageKey,
            enrolledNotEligibleParticipantsNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _enrolledNotEligibleParticipantPagingController,
          beneficiaryList,
        );
      }
    }
    notifyListeners();
  }

  Future<void> _fetchBeneficiariesWithoutAgywEnrollmentCriteriaPage(
      int pageKey) async {
    Map searchedDataValues =
        _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes;
    List<NoneParticipationBeneficiary> beneficiaryList =
        await AgywDreamsEnrollmentService()
            .getBeneficiariesWithoutEnrollmentCriteriaList(
                page: pageKey, searchedDataValues: searchedDataValues);
    if (beneficiaryList.isEmpty &&
        pageKey < beneficiariesWithoutAgywDreamsCriteriaNumberOfPages) {
      _fetchBeneficiariesWithoutAgywEnrollmentCriteriaPage(pageKey + 1);
    } else {
      if (_beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _beneficiariesWithoutAgywDreamsCriteriaPagingController,
            beneficiaryList,
            pageKey,
            beneficiariesWithoutAgywDreamsCriteriaNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _beneficiariesWithoutAgywDreamsCriteriaPagingController,
          beneficiaryList,
        );
      }
    }
    notifyListeners();
  }

  _fetchAgywPagePerIncomingReferral(int pageKey) async {
    Map searchedAttributes = _incomingReferralsSearchableValue;
    List<AgywDream> agywList = await AgywDreamsEnrollmentService()
        .getAgywBeneficiariesWithIncomingReferralList(
            page: pageKey,
            teiList: _teiWithIncomingReferral,
            searchedAttributes: searchedAttributes);
    if (agywList.isEmpty && pageKey < agywIncomingReferralNumberOfPages) {
      _fetchAgywPagePerIncomingReferral(pageKey + 1);
    } else {
      if (_incomingReferralsSearchableValue.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(
            _agywIncomingReferralPagingController,
            agywList,
            pageKey,
            agywIncomingReferralNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _agywIncomingReferralPagingController,
          agywList,
        );
      }
    }
    notifyListeners();
  }

  Future<void> _fetchNonAgywPage(int pageKey) async {
    Map searchableValue = _nonAgywSearchableValue;
    List<AgywDream> nonAgywList =
        await NoneAgywDreamsEnrollmentService().getNonAgywBeneficiaryList(
      page: pageKey,
      searchedAttributes: searchableValue,
    );
    if (nonAgywList.isEmpty && pageKey != nonAgywNumberOfPages) {
      _fetchNonAgywPage(pageKey + 1);
    } else {
      if (_nonAgywSearchableValue.isEmpty) {
        getNumberOfPages();
        PaginationService.assignPagesToController(_nonAgywPagingController,
            nonAgywList, pageKey, nonAgywNumberOfPages);
      } else {
        PaginationService.assignLastPageToController(
          _nonAgywPagingController,
          nonAgywList,
        );
      }
    }
    notifyListeners();
  }

  void initializePagination() async {
    _nonAgywPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    _agywPagingController = PagingController<int, AgywDream>(firstPageKey: 0);
    _agywIncomingReferralPagingController =
        PagingController<int, AgywDream>(firstPageKey: 0);
    _noneParticipantsPagingController =
        PagingController<int, NoneParticipationBeneficiary>(firstPageKey: 0);
    _enrolledNotEligibleParticipantPagingController =
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

    PaginationService.initializePagination(
        mounted: true,
        pagingController: _enrolledNotEligibleParticipantPagingController,
        fetchPage: _fetchAgyWDreamsEnrolledNotEligible);
  }

  Future<void> refreshBeneficiariesNumber() async {
    _isLoading = true;
    _agywSearchableValue.clear();
    _agywNoneParticipantSearchedAttributes.clear();
    _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes.clear();
    _nonAgywSearchableValue.clear();
    _noneEnrolledSearchableValue.clear();
    _incomingReferralsSearchableValue.clear();
    notifyListeners();
    await getDreamsCount();
    getNumberOfPages();
    if (_nonAgywPagingController == null ||
        _agywPagingController == null ||
        _agywIncomingReferralPagingController == null ||
        _noneParticipantsPagingController == null ||
        _enrolledNotEligibleParticipantPagingController == null ||
        _beneficiariesWithoutAgywDreamsCriteriaPagingController == null) {
      initializePagination();
    } else {
      _nonAgywPagingController!.refresh();
      _agywPagingController!.refresh();
      _agywIncomingReferralPagingController!.refresh();
      _noneParticipantsPagingController!.refresh();
      _enrolledNotEligibleParticipantPagingController!.refresh();
      _beneficiariesWithoutAgywDreamsCriteriaPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
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
    _numberOfEnrolledNotEligibleParticipant =
        await AgywDreamsEnrollmentService()
            .getEnrolledNotEligibleParticipationCount();
    notifyListeners();
  }

  void searchAgywDreamsList(Map searchedAttributes) {
    _agywSearchableValue = searchedAttributes;
    notifyListeners();
    if (_agywDreamsInterventionList.isEmpty) {
      _agywDreamsInterventionList =
          _agywPagingController!.itemList as List<AgywDream>? ?? <AgywDream>[];
      _agywNextPage = _agywPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshAgywDreamsList();
    } else {
      _agywPagingController!.itemList = _agywDreamsInterventionList;
      _agywPagingController!.nextPageKey = _agywNextPage;
      _agywDreamsInterventionList = <AgywDream>[];
      _agywNextPage = 0;
    }
  }

  void searchNonAgywList(Map searchedAttributes) {
    _nonAgywSearchableValue = searchedAttributes;
    notifyListeners();
    if (_noneAgywDreamsInterventionList.isEmpty) {
      _noneAgywDreamsInterventionList =
          _nonAgywPagingController!.itemList as List<AgywDream>? ??
              <AgywDream>[];
      _nonAgywNextPage = _nonAgywPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshNonAgywDreamsList();
    } else {
      _nonAgywPagingController!.itemList = _noneAgywDreamsInterventionList;
      _nonAgywPagingController!.nextPageKey = _nonAgywNextPage;
      _noneAgywDreamsInterventionList = <AgywDream>[];
      _nonAgywNextPage = 0;
    }
  }

  void searchIncomingReferralList(Map searchedAttributes) {
    _incomingReferralsSearchableValue = searchedAttributes;
    notifyListeners();
    if (_agywDreamsIncomingReferralList.isEmpty) {
      _agywDreamsIncomingReferralList =
          _agywIncomingReferralPagingController!.itemList as List<AgywDream>? ??
              <AgywDream>[];
      _agywIncomingReferralNextPage =
          _agywIncomingReferralPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshAgywIncomingReferralDreamsList();
    } else {
      _agywIncomingReferralPagingController!.itemList =
          _agywDreamsIncomingReferralList;
      _agywIncomingReferralPagingController!.nextPageKey =
          _agywIncomingReferralNextPage;
      _agywDreamsIncomingReferralList = <AgywDream>[];
      _agywIncomingReferralNextPage = 0;
    }
  }

  void searchAllAgywDreamsLists(Map searchedAttributes) {
    _agywSearchableValue = searchedAttributes;
    _beneficiariesWithoutAgywDreamsCriteriaSearchedAttributes =
        searchedAttributes;
    _agywNoneParticipantSearchedAttributes = searchedAttributes;
    _noneEnrolledSearchableValue = searchedAttributes;
    _nonAgywSearchableValue = searchedAttributes;
    _incomingReferralsSearchableValue = searchedAttributes;
    notifyListeners();
    if (_agywDreamsInterventionList.isEmpty) {
      _agywDreamsInterventionList =
          _agywPagingController!.itemList as List<AgywDream>? ?? <AgywDream>[];
      _agywNextPage = _agywPagingController!.nextPageKey;
    }
    if (_noneAgywDreamsInterventionList.isEmpty) {
      _noneAgywDreamsInterventionList =
          _nonAgywPagingController!.itemList as List<AgywDream>? ??
              <AgywDream>[];
      _nonAgywNextPage = _nonAgywPagingController!.nextPageKey;
    }
    if (_noneParticipationBeneficiaryList.isEmpty) {
      _noneParticipationBeneficiaryList = _noneParticipantsPagingController!
              .itemList as List<NoneParticipationBeneficiary>? ??
          <NoneParticipationBeneficiary>[];
      _noneParticipantsNextPage =
          _noneParticipantsPagingController!.nextPageKey;
    }
    if (_eligibleNotEnrollBeneficiaryList.isEmpty) {
      _eligibleNotEnrollBeneficiaryList =
          _enrolledNotEligibleParticipantPagingController!.itemList
                  as List<NoneParticipationBeneficiary>? ??
              <NoneParticipationBeneficiary>[];
      _eligibleNotEnrolledNextPage =
          _enrolledNotEligibleParticipantPagingController!.nextPageKey;
    }
    if (_unenrolledDreamsBeneficiaryList.isEmpty) {
      _unenrolledDreamsBeneficiaryList =
          _beneficiariesWithoutAgywDreamsCriteriaPagingController!.itemList
                  as List<NoneParticipationBeneficiary>? ??
              <NoneParticipationBeneficiary>[];
      _beneficiariesWithoutAgywDreamsCriteriaNextPage =
          _beneficiariesWithoutAgywDreamsCriteriaPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshAllDreamsLists();
    } else {
      _agywPagingController!.itemList = _agywDreamsInterventionList;
      _agywPagingController!.nextPageKey = _agywNextPage;
      _agywDreamsInterventionList = <AgywDream>[];
      _agywNextPage = 0;

      _nonAgywPagingController!.itemList = _noneAgywDreamsInterventionList;
      _nonAgywPagingController!.nextPageKey = _nonAgywNextPage;
      _noneAgywDreamsInterventionList = <AgywDream>[];
      _nonAgywNextPage = 0;

      _noneParticipantsPagingController!.itemList =
          _noneParticipationBeneficiaryList;
      _noneParticipantsPagingController!.nextPageKey =
          _noneParticipantsNextPage;
      _noneParticipationBeneficiaryList = <NoneParticipationBeneficiary>[];
      _noneParticipantsNextPage = 0;

      _enrolledNotEligibleParticipantPagingController!.itemList =
          _eligibleNotEnrollBeneficiaryList;
      _enrolledNotEligibleParticipantPagingController!.nextPageKey =
          _eligibleNotEnrolledNextPage;
      _eligibleNotEnrollBeneficiaryList = <NoneParticipationBeneficiary>[];
      _eligibleNotEnrolledNextPage = 0;

      _beneficiariesWithoutAgywDreamsCriteriaPagingController!.itemList =
          _unenrolledDreamsBeneficiaryList;
      _beneficiariesWithoutAgywDreamsCriteriaPagingController!.nextPageKey =
          _beneficiariesWithoutAgywDreamsCriteriaNextPage;
      _unenrolledDreamsBeneficiaryList = <NoneParticipationBeneficiary>[];
      _beneficiariesWithoutAgywDreamsCriteriaNextPage = 0;
      notifyListeners();
    }
  }

  void onNonAgywBeneficiaryAdd() {
    refreshAllDreamsLists();
  }

  void onAgywBeneficiaryAdd() {
    refreshAllDreamsLists();
  }

  void onBeneficiariesWithoutAgywDreamsCriteriaAdd() {
    refreshAllDreamsLists();
  }

  void onAgywDreamsNoneParticipantAdd() {
    refreshAllDreamsLists();
  }

  void refreshAllDreamsLists() async {
    _agywPagingController!.refresh();
    _nonAgywPagingController!.refresh();
    _agywIncomingReferralPagingController!.refresh();
    _noneParticipantsPagingController!.refresh();
    _beneficiariesWithoutAgywDreamsCriteriaPagingController!.refresh();
    _enrolledNotEligibleParticipantPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  void refreshAgywDreamsList() async {
    _agywPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
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
    _agywNumberOfPages =
        (_numberOfAgywDreamsBeneficiaries / PaginationConstants.paginationLimit)
            .ceil();
    _agywNumberOfSearchablePages = (_numberOfAgywDreamsBeneficiaries /
            PaginationConstants.searchingPaginationLimit)
        .ceil();
    _nonAgywNumberOfPages = (_numberOfNoneAgywDreamsBeneficiaries /
            PaginationConstants.paginationLimit)
        .ceil();
    _nonAgywNumberOfSearchablePages = (_numberOfNoneAgywDreamsBeneficiaries /
            PaginationConstants.searchingPaginationLimit)
        .ceil();
    _agywIncomingReferralNumberOfPages =
        (_numberOfAgywDreamsIncomingReferralBeneficiaries /
                PaginationConstants.paginationLimit)
            .ceil();
    _agywIncomingReferralNumberOfSearchablePages =
        (_numberOfAgywDreamsIncomingReferralBeneficiaries /
                PaginationConstants.searchingPaginationLimit)
            .ceil();
    _noneParticipantsNumberOfPages =
        (_numberOfNoneParticipants / PaginationConstants.paginationLimit)
            .ceil();
    _noneParticipantsNumberOfSearchablePages = (_numberOfNoneParticipants /
            PaginationConstants.searchingPaginationLimit)
        .ceil();
    _beneficiariesWithoutAgywDreamsCriteriaNumberOfPages =
        (_numberOfBeneficiariesWithoutAgywDreamsCriteria /
                PaginationConstants.paginationLimit)
            .ceil();
    _beneficiariesWithoutAgywDreamsCriteriaNumberOfSearchablePages =
        (_numberOfBeneficiariesWithoutAgywDreamsCriteria /
                PaginationConstants.searchingPaginationLimit)
            .ceil();
    _enrolledNotEligibleParticipantsNumberOfPages =
        (_numberOfEnrolledNotEligibleParticipant /
                PaginationConstants.paginationLimit)
            .ceil();

    notifyListeners();
  }
}
