import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/services/pagination_service.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';
import 'package:provider/provider.dart';

class OvcInterventionListState with ChangeNotifier {
  final BuildContext? context;

  // initial state
  List<OvcHousehold> _ovcInterventionList = <OvcHousehold>[];
  List<NoneParticipationBeneficiary> _ovcNoneParticipationList =
      <NoneParticipationBeneficiary>[];
  List<Map<String, dynamic>> _ovcFilters = [];
  PagingController? _ovcPagingController;
  PagingController? _ovcNoneParticipationPagingController;
  bool _isLoading = true;
  int _numberOfHouseholds = 0;
  int _numberOfOvcs = 0;
  int _numberOfPages = 0;
  int _numberOfSearchablePages = 0;
  int _numberOfNoneParticipants = 0;
  int _numberOfNoneParticipantsPages = 0;
  int _numberOfNoneParticipantsSearchablePages = 0;
  int? _nextPage = 0;
  int? _nextNoneParticipantPage = 0;
  Map _ovcSearchableValue = {};
  Map _noneParticipationSearchableValue = {};

  OvcInterventionListState(this.context);

  void setOvcFilters(List<Map<String, dynamic>> filters) {
    _ovcFilters = filters;
    notifyListeners();
    refreshHouseHoldsList();
  }

  void clearOvcFilters() {
    _ovcFilters.clear();
    notifyListeners();
    refreshHouseHoldsList();
  }

  int getOvcFiltersCount() {
    return _ovcFilters.length;
  }

  bool get isLoading => _isLoading;
  int get numberOfHouseholds => _numberOfHouseholds;
  int get numberOfOvcNoneParticipants => _numberOfNoneParticipants;
  int get numberOfOvcs => _numberOfOvcs;
  int get numberOfPages =>
      _ovcSearchableValue.isEmpty ? _numberOfPages : _numberOfSearchablePages;
  int get numberOfNoneParticipantsPages =>
      _noneParticipationSearchableValue.isEmpty
          ? _numberOfNoneParticipantsPages
          : _numberOfNoneParticipantsSearchablePages;
  List<Map<String, dynamic>> get ovcFilters => _ovcFilters
      .where((Map<String, dynamic> filter) => filter.isNotEmpty)
      .toList();
  PagingController? get pagingController => _ovcPagingController;
  PagingController? get noneParticipationPagingController =>
      _ovcNoneParticipationPagingController;

  void initializePagination() {
    _ovcPagingController = PagingController<int, OvcHousehold>(
      firstPageKey: 0,
    );
    _ovcNoneParticipationPagingController =
        PagingController<int, NoneParticipationBeneficiary>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ovcPagingController,
        fetchPage: _fetchOvcPage);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ovcNoneParticipationPagingController,
        fetchPage: _fetchNoneParticipationPage);
  }

  Future<void> _fetchOvcPage(int pageKey) async {
    Map searchedAttributes = _ovcSearchableValue;
    print('$searchedAttributes');
    List ovcList = await OvcEnrollmentHouseholdService().getHouseholdList(
        page: pageKey, searchableValue: '', filters: _ovcFilters);
    if (ovcList.isEmpty && pageKey < numberOfPages) {
      _fetchOvcPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _ovcPagingController, ovcList, pageKey, numberOfPages);
    }
  }

  Future<void> _fetchNoneParticipationPage(int pageKey) async {
    Map searchedAttributes = _noneParticipationSearchableValue;
    print('$searchedAttributes');
    List beneficiaryList = await OvcEnrollmentHouseholdService()
        .getNoneParticipationBeneficiaryList(
            page: pageKey, searchableValue: '');
    if (beneficiaryList.isEmpty && pageKey < numberOfNoneParticipantsPages) {
      _fetchNoneParticipationPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _ovcNoneParticipationPagingController,
          beneficiaryList,
          pageKey,
          numberOfNoneParticipantsPages);
    }
  }

  Future<void> getHouseholdCount() async {
    _numberOfHouseholds =
        await OvcEnrollmentHouseholdService().getHouseholdCount();
    _numberOfNoneParticipants =
        await OvcEnrollmentHouseholdService().getNoneParticipationCount();
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
    notifyListeners();
  }

  void searchHousehold(Map searchedAttributes) {
    _ovcSearchableValue = searchedAttributes;
    notifyListeners();
    if (_ovcInterventionList.isEmpty) {
      _ovcInterventionList =
          _ovcPagingController!.itemList as List<OvcHousehold>? ??
              <OvcHousehold>[];
      _nextPage = _ovcPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshHouseHoldsList();
    } else {
      _ovcPagingController!.itemList = _ovcInterventionList;
      _ovcPagingController!.nextPageKey = _nextPage;
      _ovcInterventionList = <OvcHousehold>[];
      _nextPage = 0;
      notifyListeners();
    }
  }

  void searchAllOvcList(Map searchedAttributes) {
    _ovcSearchableValue = searchedAttributes;
    _noneParticipationSearchableValue = searchedAttributes;
    notifyListeners();
    if (_ovcInterventionList.isEmpty) {
      _ovcInterventionList =
          _ovcPagingController!.itemList as List<OvcHousehold>? ??
              <OvcHousehold>[];
      _nextPage = _ovcPagingController!.nextPageKey;
    }
    if (_ovcNoneParticipationList.isEmpty) {
      _ovcNoneParticipationList = _ovcNoneParticipationPagingController!
              .itemList as List<NoneParticipationBeneficiary>? ??
          <NoneParticipationBeneficiary>[];
      _nextNoneParticipantPage =
          _ovcNoneParticipationPagingController!.nextPageKey;
    }
    if (searchedAttributes.isNotEmpty) {
      refreshOvcList();
    } else {
      _ovcPagingController!.itemList = _ovcInterventionList;
      _ovcPagingController!.nextPageKey = _nextPage;
      _ovcInterventionList = <OvcHousehold>[];
      _nextPage = 0;

      _ovcNoneParticipationPagingController!.itemList =
          _ovcNoneParticipationList;
      _ovcNoneParticipationPagingController!.nextPageKey =
          _nextNoneParticipantPage;
      _ovcNoneParticipationList = <NoneParticipationBeneficiary>[];
      _nextNoneParticipantPage = 0;
      notifyListeners();
    }
  }

  Future<void> refreshOvcNumber() async {
    _isLoading = true;
    _ovcSearchableValue.clear();
    _noneParticipationSearchableValue.clear();
    notifyListeners();
    await getHouseholdCount();
    getNumberOfPages();
    if (_ovcPagingController == null ||
        _ovcNoneParticipationPagingController == null) {
      initializePagination();
    } else {
      _ovcPagingController!.refresh();
      _ovcNoneParticipationPagingController!.refresh();
    }
    _isLoading = false;
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  Future<void> refreshOvcList() async {
    _ovcPagingController!.refresh();
    _ovcNoneParticipationPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  Future<void> refreshHouseHoldsList() async {
    _ovcPagingController!.refresh();
    notifyListeners();
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  Future<void> onHouseholdAdd() async {
    refreshOvcList();
  }

  void onNoneParticipantAdd() {
    refreshOvcNumber();
    refreshOvcList();
  }

  @override
  void dispose() {
    _ovcPagingController!.dispose();
    _ovcNoneParticipationPagingController!.dispose();
    super.dispose();
  }

  void getNumberOfPages() {
    _numberOfPages =
        (numberOfHouseholds / PaginationConstants.paginationLimit).ceil();
    _numberOfSearchablePages =
        (numberOfHouseholds / PaginationConstants.searchingPaginationLimit)
            .ceil();
    _numberOfNoneParticipantsPages =
        (numberOfOvcNoneParticipants / PaginationConstants.paginationLimit)
            .ceil();
    _numberOfNoneParticipantsSearchablePages = (numberOfOvcNoneParticipants /
            PaginationConstants.searchingPaginationLimit)
        .ceil();
    notifyListeners();
  }
}
