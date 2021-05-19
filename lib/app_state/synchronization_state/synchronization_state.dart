import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/services/implementing_partner_config_service.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class SynchronizationState with ChangeNotifier {
// intial state
  bool _isDataUploadingActive;
  bool _isDataDownloadingActive;
  bool _hasUnsyncedData;
  bool _isUnsyncedCheckingActive = true;
  bool _isCheckingForAvailableDataFromServer;
  SynchronizationService _synchronizationService;
  int _beneficiaryCount;
  int _beneficiaryServiceCount;
  int _conflictLCount = 0;
  String _statusMessageForAvailableDataFromServer;
  List<String> _dataDownloadProcess;
  List<String> _dataUploadProcess;
  List<Events> _eventFromServer;
  List<TrackeEntityInstance> _trackeEntityInstance;
  List<dynamic> _servertrackedEntityInstance;
  List<Map<String, dynamic>> _events_1;
  List<Map<String, dynamic>> _trackedInstance1;
  Map<String, List> _trackedInstance;
  Map<String, List> _events;
  Map<String, List> _relationships;
  double profileProgress = 0.0;
  double eventsProgress = 0.0;
  double overallProgress = 0.0;

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive ?? false;

  bool get isCheckingForAvailableDataFromServer =>
      _isCheckingForAvailableDataFromServer ?? false;

  String get statusMessageForAvailableDataFromServer =>
      _statusMessageForAvailableDataFromServer ?? '';

  bool get hasUnsyncedData => _hasUnsyncedData ?? false;

  bool get isUnsyncedCheckingActive => _isUnsyncedCheckingActive ?? false;

  bool get isDataDownloadingActive => _isDataDownloadingActive ?? false;

  int get beneficiaryCount => _beneficiaryCount ?? 0;

  int get beneficiaryServiceCount => _beneficiaryServiceCount ?? 0;

  List<String> get dataUploadProcesses => _dataUploadProcess ?? [];

  List<String> get dataDownloadProcesses => _dataDownloadProcess ?? [];

  List<Events> get eventFromServer => _eventFromServer ?? [];

  int get conflictCount => _conflictLCount ?? 0;

  List<TrackeEntityInstance> get trackedEntityInstanceFromServer =>
      _trackeEntityInstance ?? [];

  List<dynamic> get servertrackedEntityInstance =>
      _servertrackedEntityInstance ?? [];

  Map<String, List> get trackedInstance => _trackedInstance ?? {};

  Map<String, List> get events => _events ?? {};

  Map<String, List> get relationships => _relationships ?? {};

  List<Map<String, dynamic>> get events_1 => _events_1 ?? [];

  List<Map<String, dynamic>> get trackedInstance1 => _trackedInstance1 ?? [];

// reducers
  void updateDataUploadStatus(bool status) {
    _isDataUploadingActive = status;
    notifyListeners();
  }

  void updateUnsynceDataCheckingStatus(bool status) {
    _isUnsyncedCheckingActive = status;
    notifyListeners();
  }

  void updateStatusForAvailableDataFromServer({bool status}) {
    _isCheckingForAvailableDataFromServer = status;
    notifyListeners();
  }

  void setStatusMessageForAvailableDataFromServer(String statusMessage) {
    _statusMessageForAvailableDataFromServer = statusMessage;
    notifyListeners();
  }

  void updateDataDownloadStatus(bool status) {
    _isDataDownloadingActive = status;
    notifyListeners();
  }

  void addDataUploadProcess(String process) {
    _dataUploadProcess.add(process);
    notifyListeners();
  }

  void addDataDownloadProcess(String process) {
    _dataDownloadProcess.add(process);
    notifyListeners();
  }

  checkingForAvaiableBeneficiaryData() async {
    updateStatusForAvailableDataFromServer(status: true);
    setStatusMessageForAvailableDataFromServer(
        'Checking for available beneficiary data from server...');
    CurrentUser currentUser = await UserService().getCurrentUser();
    _synchronizationService = SynchronizationService(currentUser.username,
        currentUser.password, currentUser.programs, currentUser.userOrgUnitIds);
    int offlineEnrollmentsCount =
        await _synchronizationService.getOfflineEnrollmentCount(currentUser);
    int offlineEventsCount =
        await _synchronizationService.getOfflineEventsCount(currentUser);
    int onlineEnrollmentsCount =
        await _synchronizationService.getOnlineEnrollmentsCount(currentUser);
    int onlineEventsCount =
        await _synchronizationService.getOnlineEventsCount(currentUser);
    setStatusMessageForAvailableDataFromServer(
        onlineEventsCount > offlineEventsCount ||
                onlineEnrollmentsCount > offlineEnrollmentsCount
            ? 'New beneficiary data are available, try to sync!'
            : '');
    updateStatusForAvailableDataFromServer(status: false);
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      _synchronizationService = SynchronizationService(
          currentUser.username,
          currentUser.password,
          currentUser.programs,
          currentUser.userOrgUnitIds);
      int offlineEnrollmentsCount =
          await _synchronizationService.getOfflineEnrollmentCount(currentUser);
      int offlineEventsCount =
          await _synchronizationService.getOfflineEventsCount(currentUser);
      int onlineEnrollmentsCount =
          await _synchronizationService.getOnlineEnrollmentsCount(currentUser);
      int onlineEventsCount =
          await _synchronizationService.getOnlineEventsCount(currentUser);
      setStatusMessageForAvailableDataFromServer(
          onlineEventsCount > offlineEventsCount ||
                  onlineEnrollmentsCount > offlineEnrollmentsCount
              ? 'New beneficiary data are available, try to sync!'
              : '');
      updateStatusForAvailableDataFromServer(status: false);
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      setStatusMessageForAvailableDataFromServer('');
    }
  }

  Future<void> startCheckingStatusOfUnsyncedData() async {
    _dataDownloadProcess = _dataDownloadProcess ?? [];
    _dataUploadProcess = _dataUploadProcess ?? [];
    updateUnsynceDataCheckingStatus(true);
    CurrentUser user = await UserService().getCurrentUser();
    _synchronizationService = SynchronizationService(
        user.username, user.password, user.programs, user.userOrgUnitIds);
    var teis = await _synchronizationService.getTeisFromOfflineDb();
    var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
    _beneficiaryServiceCount = teiEvents.length;
    _beneficiaryCount = teis.length;
    _hasUnsyncedData = teiEvents.length > 0 || teis.length > 0;
    updateUnsynceDataCheckingStatus(false);
  }

  Future startDataDownloadActivity() async {
    _dataDownloadProcess = [];
    _eventFromServer = [];
    _servertrackedEntityInstance = [];
    _trackeEntityInstance = [];
    profileProgress = 0.0;
    eventsProgress = 0.0;
    overallProgress = 0.0;
    updateDataDownloadStatus(true);
    addDataDownloadProcess("Start Downloading....");
    int count = 0;
    int totalCount = 0;
    int total = 0;
    try {
      CurrentUser currentUser = await UserService().getCurrentUser();
      var implementingPartnerConfig = await ImplementingPartnerConfigService()
          .getImplementingPartnerConfigFromTheServer(
              currentUser.username, currentUser.password);
      List currentUserPrograms =
          implementingPartnerConfig[currentUser.implementingPartner];
      total = _synchronizationService.orgUnitIds.length *
          currentUserPrograms.length;
      for (String orgUnitId in _synchronizationService.orgUnitIds) {
        for (String program in _synchronizationService.programs
            .where((program) => currentUserPrograms.indexOf(program) != -1)) {
          count++;
          totalCount++;
          profileProgress = count / total;
          overallProgress = totalCount / (total * 2);
          addDataDownloadProcess(
              "Download and saving profile data $count/$total");
          await _synchronizationService.getAndSaveTrackedInstanceFromServer(
              program, orgUnitId);
        }
      }
      count = 0;
      for (String orgUnitId in _synchronizationService.orgUnitIds) {
        for (String program in _synchronizationService.programs
            .where((program) => currentUserPrograms.indexOf(program) != -1)) {
          count++;
          totalCount++;
          eventsProgress = count / total;
          overallProgress = totalCount / (total * 2);
          addDataDownloadProcess(
              "Download and saving service data $count/$total");
          await _synchronizationService.getAndSaveEventsFromServer(
              program, orgUnitId);
        }
      }
      AppUtil.showToastMessage(message: 'Download successful');
      _dataDownloadProcess = [];
      updateDataDownloadStatus(false);
      setStatusMessageForAvailableDataFromServer('');
    } catch (e) {
      _dataDownloadProcess = [];
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      updateDataDownloadStatus(false);
      AppUtil.showToastMessage(message: 'Error downloading data');
    }
  }

  Future startDataUploadActivity() async {
    _dataUploadProcess = [];
    updateDataUploadStatus(true);
    try {
      addDataUploadProcess('Prepare offline data to upload');
      var teis = await _synchronizationService.getTeisFromOfflineDb();
      var teiEnrollments =
          await _synchronizationService.getTeiEnrollmentFromOfflineDb();
      if (teis.length > 0) {
        addDataUploadProcess("Uploading beneficiary's profile data");
        await _synchronizationService.uploadTeisToTheServer(
            teis, teiEnrollments);

        var teiRelationships =
            await _synchronizationService.getTeiRelationShipFromOfflineDb();
        await _synchronizationService
            .uploadTeiRelationToTheServer(teiRelationships);
      }

      var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
      if (teiEvents.length > 0) {
        addDataUploadProcess("Uploading beneficiary's service data");
        _dataUploadProcess = [];
        await _synchronizationService.uploadTeiEventsToTheServer(teiEvents);
      }
    } catch (e) {
      _dataUploadProcess = [];
      AppUtil.showToastMessage(message: 'Error uploading data');
      updateDataUploadStatus(false);
    }
    updateDataUploadStatus(false);
  }
}
