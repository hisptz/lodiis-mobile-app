import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/referral_nofitication_state/referral_nofitication_state.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/services/implementing_partner_config_service.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class SynchronizationState with ChangeNotifier {
  final BuildContext context;

  SynchronizationState({this.context});

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
  double profileDataDownloadProgress = 0.0;
  double eventsDataDownloadProgress = 0.0;
  double overallDownloadProgress = 0.0;
  double profileDataUploadProgress = 0.0;
  double eventsDataUploadProgress = 0.0;
  double overallUploadProgress = 0.0;

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive ?? false;

  double get overallSyncProgress => hasUnsyncedData
      ? (overallUploadProgress + overallDownloadProgress) / 2
      : overallUploadProgress + overallDownloadProgress;

  double get eventsSyncProgress =>
      eventsDataUploadProgress + eventsDataDownloadProgress;

  double get profileSyncProgress =>
      profileDataUploadProgress + profileDataDownloadProgress;

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

  Future<void> startCheckingStatusOfUnsyncedData(
      {bool isAutoUpload = false}) async {
    _dataDownloadProcess = _dataDownloadProcess ?? [];
    _dataUploadProcess = _dataUploadProcess ?? [];
    if (!isAutoUpload) {
      updateUnsynceDataCheckingStatus(true);
    }
    CurrentUser user = await UserService().getCurrentUser();
    _synchronizationService = SynchronizationService(
        user.username, user.password, user.programs, user.userOrgUnitIds);
    var teis = await _synchronizationService.getTeisFromOfflineDb();
    var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
    _beneficiaryServiceCount = teiEvents.length;
    _beneficiaryCount = teis.length;
    _hasUnsyncedData = teiEvents.length > 0 || teis.length > 0;
    if (!isAutoUpload) {
      updateUnsynceDataCheckingStatus(false);
    }
  }

  Future startSyncActivity({String syncAction}) async {
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    switch (syncAction) {
      case 'Download':
        await startDataDownloadActivity();
        break;
      case 'Upload':
        await startDataUploadActivity();
        break;
      case 'Download and Upload':
        await startDataDownloadActivity(skipUpload: false);
        await startDataUploadActivity();
        break;
      default:
        break;
    }
  }

  Future startDataDownloadActivity({bool skipUpload = true}) async {
    _dataDownloadProcess = [];
    _eventFromServer = [];
    _servertrackedEntityInstance = [];
    _trackeEntityInstance = [];
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
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
          profileDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
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
          eventsDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
          addDataDownloadProcess(
              "Download and saving service data $count/$total");
          await _synchronizationService.getAndSaveEventsFromServer(
              program, orgUnitId);
        }
      }
      if (skipUpload) {
        AppUtil.showToastMessage(
          message: 'Start synchronisation of referral notitifcations',
          position: ToastGravity.TOP,
        );
        await ReferralNotificationService().syncReferralNotifications();
      }
      AppUtil.showToastMessage(
          message: 'Data has been successfully donwloaded');
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
    await Provider.of<ReferralNotificationState>(context, listen: false)
        .reloadReferralNotifications();
    List<String> teiWithIncomingReferral =
        Provider.of<ReferralNotificationState>(context, listen: false)
            .beneficiariesWithIncomingReferrals;
    Provider.of<DreamsInterventionListState>(context, listen: false)
        .setTeiWithIncomingReferral(
            teiWithIncomingReferral: teiWithIncomingReferral);
    await Provider.of<OvcInterventionListState>(context, listen: false)
        .refreshOvcNumber();
    await Provider.of<DreamsInterventionListState>(context, listen: false)
        .refreshBeneficiariesNumber();
    await Provider.of<OgacInterventionListState>(context, listen: false)
        .refreshOgacList();
  }

  Future startDataUploadActivity({bool isAutoUpload = false}) async {
    _dataUploadProcess = [];
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    updateDataUploadStatus(true);
    try {
      int profileCount = 0;
      int profileTotalCount = 1;
      int eventsCount = 0;
      int eventsTotalCount = 1;
      addDataUploadProcess('Prepare offline data to upload');

      var teis = await _synchronizationService.getTeisFromOfflineDb();
      profileCount++;
      profileTotalCount++;
      profileDataUploadProgress = profileCount / profileTotalCount;
      overallUploadProgress =
          (profileDataUploadProgress + eventsDataUploadProgress) / 2;
      if (teis.length > 0) {
        addDataUploadProcess("Uploading beneficiary's profile data");
        await _synchronizationService.uploadTeisToTheServer(teis, isAutoUpload);
      }

      var teiEnrollments =
          await _synchronizationService.getTeiEnrollmentFromOfflineDb();
      profileCount++;
      profileTotalCount++;
      profileDataUploadProgress = profileCount / profileTotalCount;
      overallUploadProgress =
          (profileDataUploadProgress + eventsDataUploadProgress) / 2;
      if (teiEnrollments.length > 0) {
        await _synchronizationService.uploadEnrollmentsToTheServer(
            teiEnrollments, isAutoUpload);
      }

      var teiRelationships =
          await _synchronizationService.getTeiRelationShipFromOfflineDb();
      profileCount++;
      profileDataUploadProgress = profileCount / profileTotalCount;
      overallUploadProgress =
          (profileDataUploadProgress + eventsDataUploadProgress) / 2;
      if (teiRelationships.length > 0) {
        await _synchronizationService.uploadTeiRelationToTheServer(
            teiRelationships, isAutoUpload);
      }

      var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
      eventsCount++;
      eventsDataUploadProgress = eventsCount / eventsTotalCount;
      overallUploadProgress =
          profileDataUploadProgress + eventsDataUploadProgress;
      if (teiEvents.length > 0) {
        addDataUploadProcess("Uploading beneficiary's service data");
        _dataUploadProcess = [];

        await _synchronizationService.uploadTeiEventsToTheServer(
            teiEvents, isAutoUpload);
      }
      AppUtil.showToastMessage(
        message: 'Start synchronisation of referral notifications',
        position: ToastGravity.TOP,
      );
      await ReferralNotificationService().syncReferralNotifications();
    } catch (e) {
      _dataUploadProcess = [];
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
      updateDataUploadStatus(false);
    }
    _dataUploadProcess = [];
    notifyListeners();
    await startCheckingStatusOfUnsyncedData(isAutoUpload: isAutoUpload);
    notifyListeners();
    await Provider.of<ReferralNotificationState>(context, listen: false)
        .reloadReferralNotifications();
    updateDataUploadStatus(false);
  }
}
