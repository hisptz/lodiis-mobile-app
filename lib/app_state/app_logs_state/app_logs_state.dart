import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/services/pagination-service.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/modules/app_logs/services/app_logs_service.dart';

class AppLogsState with ChangeNotifier {
  // initial state
  List<AppLogs> _appLogsList = <AppLogs>[];
  bool _isLoading = false;
  int _numberOfAppLogs = 0;
  int _numberOfPages = 0;
  int _nextPage = 0;

  PagingController _pagingController;

  // selectors
  bool get isLoading => _isLoading != null ? _isLoading : false;
  int get numberOfPages => _numberOfPages;
  int get nextPage => _nextPage;
  PagingController get pagingController => _pagingController;

  Future<void> refreshAppLogsNumber() async {
    _isLoading = true;
    notifyListeners();
    await getAppLogsCount();
    await getNumberOfPages();
    if (_pagingController == null) {
      initializePagination();
    } else {
      _pagingController.refresh();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshAppLogsList() async {
    _pagingController.refresh();
    notifyListeners();
  }

  void searchAppLogs(String value) {
    if (_appLogsList.isEmpty) {
      _appLogsList = _pagingController.itemList ?? <AppLogs>[];
      _nextPage = _pagingController.nextPageKey;
    }
    if (value.isNotEmpty) {
      final filteredAppLogsList = _appLogsList
          .where((AppLogs appLog) =>
              appLog.searchableValue.indexOf(value.toLowerCase()) > -1)
          .toList();
      _pagingController.itemList = filteredAppLogsList;
      _pagingController.nextPageKey = null;
    } else {
      _pagingController.itemList = _appLogsList;
      _pagingController.nextPageKey = _nextPage;
      _appLogsList = <AppLogs>[];
      _nextPage = 0;
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    List<AppLogs> logsList = await AppLogsService().getAppLogs(page: pageKey);
    PaginationService.assignPagesToController(
      _pagingController,
      logsList,
      pageKey,
      numberOfPages,
    );
  }

  void initializePagination() {
    _pagingController = PagingController<int, AppLogs>(firstPageKey: 0);
    PaginationService.initializePagination(
        mounted: true,
        pagingController: _pagingController,
        fetchPage: _fetchPage);
  }

  void onAppLogsAdd() {
    _numberOfAppLogs = _numberOfAppLogs + 1;
    getNumberOfPages();
    notifyListeners();
  }

  getNumberOfPages() {
    _numberOfPages =
        (_numberOfAppLogs / AppLogsConstants.logsPagnationLimit).ceil();
  }

  Future<void> getAppLogsCount() async {
    _numberOfAppLogs = await AppLogsService().getAppLogsCount();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
