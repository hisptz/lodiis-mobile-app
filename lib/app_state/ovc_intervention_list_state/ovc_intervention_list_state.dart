import 'package:flutter/foundation.dart';
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
  PagingController? _ovcPagingController;
  PagingController? _ovcNoneParticipationPagingController;
  bool _isLoading = true;
  int _numberOfHouseholds = 0;
  int _numberOfOvcs = 0;
  int _numberOfPages = 0;
  int _numberOfNoneParticipants = 0;
  int _numberOfNoneParticipantsPages = 0;
  int? _nextPage = 0;
  int? _nextNoneParticipantPage = 0;
  String _searchableValue = '';

  OvcInterventionListState(this.context);

  bool get isLoading => _isLoading != null ? _isLoading : false;

  int get numberOfHouseholds => _numberOfHouseholds;

  int get numberOfOvcNoneParticipants => _numberOfNoneParticipants;

  int get numberOfOvcs => _numberOfOvcs;

  int get numberOfPages => _numberOfPages;

  int get numberOfNoneParticipantsPages => _numberOfNoneParticipantsPages;

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
        fetchPage: _fetchPage);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _ovcNoneParticipationPagingController,
        fetchPage: _fetchNoneParticipationPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List ovcList = await OvcEnrollmentHouseholdService()
        .getHouseholdList(page: pageKey, searchableValue: searchableValue);
    if (ovcList.isEmpty && pageKey < numberOfPages) {
      _fetchPage(pageKey + 1);
    } else {
      getNumberOfPages();
      PaginationService.assignPagesToController(
          _ovcPagingController, ovcList, pageKey, numberOfPages);
    }
  }

  Future<void> _fetchNoneParticipationPage(int pageKey) async {
    String searchableValue = _searchableValue;
    List beneficiaryList = await OvcEnrollmentHouseholdService()
        .getNoneParticipationBeneficiaryList(
            page: pageKey, searchableValue: searchableValue);
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

  // reducers
  void updateNumberOfOvcBeneficiaries() {
    _isLoading = false;
    searchHousehold('');
  }

  Future<void> getHouseholdCount() async {
    _numberOfHouseholds =
        await OvcEnrollmentHouseholdService().getHouseholdCount();
    _numberOfNoneParticipants =
        await await OvcEnrollmentHouseholdService().getNoneParticipationCount();
    ;
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();
  }

  void searchHousehold(String value) {
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
    if (value != '') {
      _searchableValue = value;
      notifyListeners();
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
    //write code to count and update number of Households and number of OVC
    _isLoading = true;
    _searchableValue = '';
    notifyListeners();
    await getHouseholdCount();
    //Update number of Pages
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
  }

  Future<void> onHouseholdAdd() async {
    _numberOfHouseholds = _numberOfHouseholds + 1;
    _numberOfOvcs = await OvcEnrollmentChildService().getOvcCount();

    getNumberOfPages();
    notifyListeners();
    refreshOvcList();
  }

  void onNoneParticipantAdd() {
    _numberOfNoneParticipants = _numberOfNoneParticipants + 1;
    getNumberOfPages();
    notifyListeners();
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
    _numberOfNoneParticipantsPages = _numberOfPages =
        (numberOfHouseholds / PaginationConstants.paginationLimit).ceil();
    notifyListeners();
  }
}
