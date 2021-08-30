import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/constants/app_logs_constants.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/services/implementing_partner_config_service.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class SynchronizationState with ChangeNotifier {
  final BuildContext? context;
  final String lastSyncDatePreferenceKey = "lastSyncDatePreferenceKey";
  final int dataUploadBatchSize = 50;

  SynchronizationState({this.context});

// initial state
  bool _isDataUploadingActive = false;
  bool _isDataDownloadingActive = false;
  bool? _hasUnsyncedData;
  bool _isUnsyncedCheckingActive = true;
  bool? _isCheckingForAvailableDataFromServer;
  late SynchronizationService _synchronizationService;
  int? _beneficiaryCount;
  int? _beneficiaryServiceCount;
  int _conflictLCount = 0;
  String? _statusMessageForAvailableDataFromServer;
  List<String>? _dataDownloadProcess;
  List<String>? _dataUploadProcess;
  List<Events>? _eventFromServer;
  List<TrackedEntityInstance>? _trackedEntityInstance;
  List<dynamic>? _serverTrackedEntityInstance;
  List<Map<String, dynamic>>? _events_1;
  List<Map<String, dynamic>>? _trackedInstance1;
  Map<String, List>? _trackedInstance;
  Map<String, List>? _events;
  Map<String, List>? _relationships;
  String? _currentSyncAction = '';
  double profileDataDownloadProgress = 0.0;
  double eventsDataDownloadProgress = 0.0;
  double overallDownloadProgress = 0.0;
  double profileDataUploadProgress = 0.0;
  double eventsDataUploadProgress = 0.0;
  double overallUploadProgress = 0.0;

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive;

  double get overallSyncProgress => hasUnsyncedData
      ? (overallUploadProgress + overallDownloadProgress) / 2
      : overallUploadProgress + overallDownloadProgress;

  double get eventsSyncProgress => _isDataUploadingActive
      ? eventsDataUploadProgress
      : _isDataDownloadingActive
          ? eventsDataDownloadProgress
          : 0.0;

  double get profileSyncProgress => _isDataUploadingActive
      ? profileDataUploadProgress
      : _isDataDownloadingActive
          ? profileDataDownloadProgress
          : 0.0;

  bool get isCheckingForAvailableDataFromServer =>
      _isCheckingForAvailableDataFromServer ?? false;

  String get statusMessageForAvailableDataFromServer =>
      _statusMessageForAvailableDataFromServer ?? '';

  String get currentSyncAction => _currentSyncAction ?? '';

  bool get hasUnsyncedData => _hasUnsyncedData ?? false;

  bool get isUnsyncedCheckingActive => _isUnsyncedCheckingActive;

  bool get isDataDownloadingActive => _isDataDownloadingActive;

  int get beneficiaryCount => _beneficiaryCount ?? 0;

  int get beneficiaryServiceCount => _beneficiaryServiceCount ?? 0;

  List<String> get dataUploadProcesses => _dataUploadProcess ?? [];

  List<String> get dataDownloadProcesses => _dataDownloadProcess ?? [];

  List<Events> get eventFromServer => _eventFromServer ?? [];

  int get conflictCount => _conflictLCount;

  List<TrackedEntityInstance> get trackedEntityInstanceFromServer =>
      _trackedEntityInstance ?? [];

  List<dynamic> get serverTrackedEntityInstance =>
      _serverTrackedEntityInstance ?? [];

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

  void updateUnsyncedDataCheckingStatus(bool status) {
    _isUnsyncedCheckingActive = status;
    notifyListeners();
  }

  void updateStatusForAvailableDataFromServer({bool? status}) {
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
    _dataUploadProcess!.add(process);
    notifyListeners();
  }

  void addDataDownloadProcess(String process) {
    _dataDownloadProcess!.add(process);
    notifyListeners();
  }

  checkingForAvailableBeneficiaryData() async {
    updateStatusForAvailableDataFromServer(status: true);
    setStatusMessageForAvailableDataFromServer(
        'Checking for available beneficiary data from server...');
    CurrentUser? currentUser = await (UserService().getCurrentUser());
    String? lastSyncDate =
        await PreferenceProvider.getPreferenceValue(lastSyncDatePreferenceKey);
    lastSyncDate =
        lastSyncDate ?? AppUtil.formattedDateTimeIntoString(new DateTime(2020));
    _synchronizationService = SynchronizationService(currentUser!.username,
        currentUser.password, currentUser.programs, currentUser.userOrgUnitIds);
    try {
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      _synchronizationService = SynchronizationService(
          currentUser!.username,
          currentUser.password,
          currentUser.programs,
          currentUser.userOrgUnitIds);
      int onlineEnrollmentsCount = await _synchronizationService
          .getOnlineEnrollmentsCount(currentUser, lastSyncDate);
      int onlineEventsCount = await _synchronizationService
          .getOnlineEventsCount(currentUser, lastSyncDate);
      setStatusMessageForAvailableDataFromServer(
          onlineEventsCount > 0 || onlineEnrollmentsCount > 0
              ? 'New beneficiary data are available, try to sync!'
              : '');
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      setStatusMessageForAvailableDataFromServer('');
    }
    updateStatusForAvailableDataFromServer(status: false);
  }

  Future<void> startCheckingStatusOfUnsyncedData(
      {bool isAutoUpload = false}) async {
    _dataDownloadProcess = _dataDownloadProcess ?? [];
    _dataUploadProcess = _dataUploadProcess ?? [];
    if (!isAutoUpload) {
      updateUnsyncedDataCheckingStatus(true);
    }
    CurrentUser? user = await (UserService().getCurrentUser());
    _synchronizationService = SynchronizationService(
        user!.username, user.password, user.programs, user.userOrgUnitIds);
    int unsyncedTeiCount = await _synchronizationService.getUnsyncedTeiCount();
    int unsyncedEventsCount =
        await _synchronizationService.getUnsyncedEventsCount();
    _beneficiaryServiceCount = unsyncedEventsCount;
    _beneficiaryCount = unsyncedTeiCount;
    _hasUnsyncedData = unsyncedEventsCount > 0 || unsyncedTeiCount > 0;
    if (!isAutoUpload) {
      updateUnsyncedDataCheckingStatus(false);
    }
  }

  Future startSyncActivity({String? syncAction}) async {
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    _currentSyncAction = syncAction;
    notifyListeners();
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
    //  reset sync action
    _currentSyncAction = '';
    notifyListeners();
  }

  Future startDataDownloadActivity({bool skipUpload = true}) async {
    _dataDownloadProcess = [];
    _eventFromServer = [];
    _serverTrackedEntityInstance = [];
    _trackedEntityInstance = [];
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    updateDataDownloadStatus(true);
    addDataDownloadProcess("Start Downloading....");
    int count = 0;
    int totalCount = 0;
    int total = 0;
    try {
      String? lastSyncDate = await PreferenceProvider.getPreferenceValue(
          lastSyncDatePreferenceKey);
      lastSyncDate = lastSyncDate ??
          AppUtil.formattedDateTimeIntoString(new DateTime(2020));
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      var implementingPartnerConfig = await ImplementingPartnerConfigService()
          .getImplementingPartnerConfigFromTheServer(
              currentUser!.username, currentUser.password);
      List currentUserPrograms =
          implementingPartnerConfig[currentUser.implementingPartner];
      total = _synchronizationService.orgUnitIds!.length *
          currentUserPrograms.length;
      for (String? orgUnitId in _synchronizationService.orgUnitIds ?? []) {
        for (String? program in _synchronizationService.programs!
            .where((program) => currentUserPrograms.indexOf(program) != -1)) {
          count++;
          totalCount++;
          profileDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
          notifyListeners();
          addDataDownloadProcess(
              "Download and saving profile data $count/$total");
          await _synchronizationService.getAndSaveTrackedInstanceFromServer(
              program, orgUnitId, lastSyncDate);
        }
      }
      count = 0;
      for (String? orgUnitId in _synchronizationService.orgUnitIds ?? []) {
        for (String? program in _synchronizationService.programs!
            .where((program) => currentUserPrograms.indexOf(program) != -1)) {
          count++;
          totalCount++;
          eventsDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
          notifyListeners();
          addDataDownloadProcess(
              "Download and saving service data $count/$total");
          await _synchronizationService.getAndSaveEventsFromServer(
              program, orgUnitId, lastSyncDate);
        }
      }
      AppUtil.showToastMessage(
        message: 'Start synchronization of referral notifications',
        position: ToastGravity.TOP,
      );
      await ReferralNotificationService().syncReferralNotifications();
      await refreshBeneficiaryCounts();
      AppUtil.showToastMessage(
          message: 'Data has been successfully downloaded');

      _dataDownloadProcess = [];
      updateDataDownloadStatus(false);
      setStatusMessageForAvailableDataFromServer('');
      lastSyncDate = AppUtil.formattedDateTimeIntoString(new DateTime.now());
      await PreferenceProvider.setPreferenceValue(
          lastSyncDatePreferenceKey, lastSyncDate);
    } catch (e) {
      _dataDownloadProcess = [];
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: 'startDataDownloadActivity: ${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      updateDataDownloadStatus(false);
      AppUtil.showToastMessage(message: 'Error downloading data');
    }
  }

  Future refreshBeneficiaryCounts() async {
    await Provider.of<ReferralNotificationState>(context!, listen: false)
        .reloadReferralNotifications();
    List<String> teiWithIncomingReferral =
        Provider.of<ReferralNotificationState>(context!, listen: false)
            .beneficiariesWithIncomingReferrals;
    Provider.of<DreamsInterventionListState>(context!, listen: false)
        .setTeiWithIncomingReferral(
            teiWithIncomingReferral: teiWithIncomingReferral);
    await Provider.of<OvcInterventionListState>(context!, listen: false)
        .refreshOvcNumber();
    await Provider.of<DreamsInterventionListState>(context!, listen: false)
        .refreshBeneficiariesNumber();
    await Provider.of<OgacInterventionListState>(context!, listen: false)
        .refreshOgacList();
  }

  Future startDataUploadActivity({bool isAutoUpload = false}) async {
    _dataUploadProcess = [];
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    updateDataUploadStatus(true);
    try {
      double profileCount = 0;
      int profileTotalCount = 3;
      double eventsCount = 0;
      int eventsTotalCount = 1;
      bool conflictOnTeisImport = false;
      bool conflictOnEventsImport = false;
      addDataUploadProcess('Prepare offline data to upload');

      var teis = await _synchronizationService.getTeisFromOfflineDb();
      if (teis.length > 0) {
        addDataUploadProcess("Uploading beneficiary's profile data");
        List<List<dynamic>> chunkedTeis =
            AppUtil.chunkItems(items: teis, size: dataUploadBatchSize);
        int batch = 1;
        for (List<dynamic> teiChunk in chunkedTeis) {
          bool conflictOnImport =
              await _synchronizationService.uploadTeisToTheServer(
                  teiChunk as List<TrackedEntityInstance>, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;

          profileCount = profileCount + (batch / chunkedTeis.length);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
          ++batch;
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      var teiEnrollments =
          await _synchronizationService.getTeiEnrollmentFromOfflineDb();

      if (teiEnrollments.length > 0) {
        int batch = 1;
        List<List<dynamic>> chunkedTeiEnrollments = AppUtil.chunkItems(
            items: teiEnrollments, size: dataUploadBatchSize * 2);
        for (List<dynamic> teiEnrollmentChunk in chunkedTeiEnrollments) {
          bool conflictOnImport =
              await _synchronizationService.uploadEnrollmentsToTheServer(
                  teiEnrollmentChunk as List<Enrollment>, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;

          profileCount = profileCount + (batch / chunkedTeiEnrollments.length);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
          ++batch;
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      var teiRelationships =
          await _synchronizationService.getTeiRelationShipFromOfflineDb();

      if (teiRelationships.length > 0) {
        List<List<dynamic>> chunkedTeiRelationships = AppUtil.chunkItems(
            items: teiRelationships, size: dataUploadBatchSize * 2);

        int batch = 1;
        for (List<dynamic> teiRelationshipChunk in chunkedTeiRelationships) {
          bool conflictOnImport =
              await _synchronizationService.uploadTeiRelationToTheServer(
                  teiRelationshipChunk as List<TeiRelationship>, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;

          profileCount =
              profileCount + (batch / chunkedTeiRelationships.length);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
          ++batch;
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();

      if (teiEvents.length > 0) {
        addDataUploadProcess("Uploading beneficiary's service data");
        List<List<dynamic>> chunkedTeiEvents =
            AppUtil.chunkItems(items: teiEvents, size: dataUploadBatchSize * 2);

        int batch = 1;
        for (List<dynamic> teiEventsChunk in chunkedTeiEvents) {
          bool conflictOnImport =
              await _synchronizationService.uploadTeiEventsToTheServer(
                  teiEventsChunk as List<Events>, isAutoUpload);
          conflictOnEventsImport = conflictOnEventsImport || conflictOnImport;

          eventsCount = eventsCount + (batch / chunkedTeiEvents.length);
          eventsDataUploadProgress = eventsCount / eventsTotalCount;
          overallUploadProgress =
              profileDataUploadProgress + eventsDataUploadProgress;
          notifyListeners();
          ++batch;
        }
      } else {
        ++eventsCount;
        eventsDataUploadProgress = eventsCount / eventsTotalCount;
        overallUploadProgress =
            profileDataUploadProgress + eventsDataUploadProgress;
        notifyListeners();
      }
      if (!isAutoUpload) {
        AppUtil.showToastMessage(
          message: 'Start synchronization of referral notifications',
          position: ToastGravity.TOP,
        );
      }
      await ReferralNotificationService().syncReferralNotifications();
      if (!isAutoUpload) {
        if (conflictOnTeisImport && conflictOnEventsImport) {
          AppUtil.showToastMessage(message: 'Error uploading data');
        } else if (conflictOnTeisImport) {
          AppUtil.showToastMessage(
              message: 'Error uploading some Beneficiaries');
        } else if (conflictOnEventsImport) {
          AppUtil.showToastMessage(message: 'Error uploading some Services');
        }
      }
    } catch (e) {
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
      updateDataUploadStatus(false);
    }
    _dataUploadProcess = [];
    notifyListeners();
    await startCheckingStatusOfUnsyncedData(isAutoUpload: isAutoUpload);
    notifyListeners();
    await Provider.of<ReferralNotificationState>(context!, listen: false)
        .reloadReferralNotifications();
    updateDataUploadStatus(false);
  }
}
