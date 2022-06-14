import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_bursary_state.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_lbse_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_status_state.dart';
import 'package:kb_mobile_app/core/constants/app_logs_constants.dart';
import 'package:kb_mobile_app/core/constants/pagination.dart';
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
import 'package:kb_mobile_app/models/referral_notification.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/synchronization/constants/synchronization_actions_constants.dart';
import 'package:provider/provider.dart';

class SynchronizationState with ChangeNotifier {
  final BuildContext? context;
  final String lastDataDownloadDatePreferenceKey = "lastSyncDatePreferenceKey";
  final String lastDataUploadDatePreferenceKey =
      "lastDataUploadDatePreferenceKey";
  final int dataUploadBatchSize = 50;

  SynchronizationState({this.context});

// initial state
  bool _isDataUploadingActive = false;
  bool _isDataDownloadingActive = false;
  bool? _hasUnsyncedData;
  bool? _isDataAvailableForDownload;
  bool _isUnsyncedCheckingActive = true;
  bool? _isCheckingForAvailableDataFromServer;
  bool _dataUploadStopped = true;
  bool _dataDownloadStopped = true;
  int? _beneficiaryCount;
  int? _beneficiaryServiceCount;
  final int _conflictLCount = 0;
  String? _statusMessageForAvailableDataFromServer;
  String _currentSyncAction = '';
  double _notificationProgress = 0.0;
  double profileDataDownloadProgress = 0.0;
  double eventsDataDownloadProgress = 0.0;
  double overallDownloadProgress = 0.0;
  double profileDataUploadProgress = 0.0;
  double eventsDataUploadProgress = 0.0;
  double overallUploadProgress = 0.0;
  List<String>? _dataDownloadProcess;
  List<String>? _dataUploadProcess;
  List<Map<String, dynamic>>? _eventsWithConflicts;
  List<Map<String, dynamic>>? _trackedEntityInstancesWithConflicts;
  List<TrackedEntityInstance>? _trackedEntityInstance;
  List<Events>? _eventFromServer;
  List<dynamic>? _serverTrackedEntityInstance;
  Map<String, List>? _trackedInstance;
  Map<String, List>? _events;
  Map<String, List>? _relationships;
  late SynchronizationService _synchronizationService;

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive;

  double get notificationProgress => _notificationProgress;

  double get overallSyncProgress =>
      _currentSyncAction == SynchronizationActionsConstants().downloadAndUpload
          ? (overallUploadProgress +
                  overallDownloadProgress +
                  notificationProgress) /
              3
          : ((overallUploadProgress + overallDownloadProgress) +
                  notificationProgress) /
              2;

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

  String get currentSyncAction => _currentSyncAction;

  bool get hasUnsyncedData => _hasUnsyncedData ?? false;

  bool get isDataAvailableForDownload => _isDataAvailableForDownload ?? false;

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

  List<Map<String, dynamic>> get eventsWithConflicts =>
      _eventsWithConflicts ?? [];

  List<Map<String, dynamic>> get trackedEntityInstancesWithConflicts =>
      _trackedEntityInstancesWithConflicts ?? [];

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

  checkingForAvailableBeneficiaryData() async {
    updateStatusForAvailableDataFromServer(status: true);
    setStatusMessageForAvailableDataFromServer(
        'Checking for available beneficiary data from server...');
    CurrentUser? currentUser = await (UserService().getCurrentUser());
    String? lastSyncDate = await PreferenceProvider.getPreferenceValue(
        lastDataDownloadDatePreferenceKey);
    lastSyncDate =
        lastSyncDate ?? AppUtil.formattedDateTimeIntoString(DateTime(2020));
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
      _isDataAvailableForDownload =
          onlineEnrollmentsCount > 0 || onlineEventsCount > 0;
      notifyListeners();
      setStatusMessageForAvailableDataFromServer(_isDataAvailableForDownload!
          ? 'New beneficiary data are available, try to sync!'
          : '');
    } catch (e) {
      AppLogs log =
          AppLogs(type: AppLogsConstants.errorLogType, message: e.toString());
      await AppLogsOfflineProvider().addLogs(log);
      setStatusMessageForAvailableDataFromServer('');
    }
    updateStatusForAvailableDataFromServer(status: false);
  }

  Future<void> startCheckingStatusOfUnsyncedData({
    bool isAutoUpload = false,
  }) async {
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
    } else {
      Provider.of<SynchronizationStatusState>(context!, listen: false)
          .resetSyncStatusReferences();
    }
  }

  stopSyncActivity() async {
    _isDataDownloadingActive = false;
    _isDataUploadingActive = false;
    _dataUploadStopped = true;
    _dataDownloadStopped = true;
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    _notificationProgress = 0.0;
    _currentSyncAction = '';
    notifyListeners();
    await refreshBeneficiaryCounts();
  }

  Future startSyncActivity({String? syncAction}) async {
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    _notificationProgress = 0.0;
    _currentSyncAction = syncAction!;
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
    await syncReferralNotifications();

    _dataDownloadProcess = [];
    _dataUploadProcess = [];
    updateDataDownloadStatus(false);
    updateDataUploadStatus(false);
    _currentSyncAction = '';
    notifyListeners();
  }

  Future startDataDownloadActivity({bool skipUpload = true}) async {
    profileDataDownloadProgress = 0.0;
    eventsDataDownloadProgress = 0.0;
    overallDownloadProgress = 0.0;
    _dataDownloadStopped = false;
    updateDataDownloadStatus(true);
    int count = 0;
    int totalCount = 0;
    int total = 0;
    try {
      String? lastSyncDate = await PreferenceProvider.getPreferenceValue(
          lastDataDownloadDatePreferenceKey);
      lastSyncDate =
          lastSyncDate ?? AppUtil.formattedDateTimeIntoString(DateTime(2020));
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
            .where((program) => currentUserPrograms.contains(program))) {
          if (_dataDownloadStopped) {
            return;
          }
          await _synchronizationService.getAndSaveTrackedInstanceFromServer(
              program, orgUnitId, lastSyncDate);
          count++;
          totalCount++;
          profileDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
          notifyListeners();
        }
      }

      count = 0;
      for (String? orgUnitId in _synchronizationService.orgUnitIds ?? []) {
        for (String? program in _synchronizationService.programs!
            .where((program) => currentUserPrograms.contains(program))) {
          if (_dataDownloadStopped) {
            return;
          }
          await _synchronizationService.getAndSaveEventsFromServer(
              program, orgUnitId, lastSyncDate);
          count++;
          totalCount++;
          eventsDataDownloadProgress = count / total;
          overallDownloadProgress = totalCount / (total * 2);
          notifyListeners();
        }
      }
      await refreshBeneficiaryCounts();
      AppUtil.showToastMessage(
          message: 'Data has been successfully downloaded');
      setStatusMessageForAvailableDataFromServer('');
      lastSyncDate = AppUtil.formattedDateTimeIntoString(DateTime.now());
      await PreferenceProvider.setPreferenceValue(
          lastDataDownloadDatePreferenceKey, lastSyncDate);
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

  Future startDataUploadActivity({bool isAutoUpload = false}) async {
    _dataUploadProcess = [];
    profileDataUploadProgress = 0.0;
    eventsDataUploadProgress = 0.0;
    overallUploadProgress = 0.0;
    _dataUploadStopped = false;
    updateDataUploadStatus(true);
    try {
      double profileCount = 0;
      int profileTotalCount = 3;
      double eventsCount = 0;
      int eventsTotalCount = 1;
      bool conflictOnTeisImport = false;
      bool conflictOnEventsImport = false;

      CurrentUser? currentUser = await UserService().getCurrentUser();

      // TODO: move the trackedEntityInstance upload to a function
      var teiCount =
          await _synchronizationService.getOfflineTrackedEntityInstanceCount();
      if (teiCount > 0) {
        int totalPages =
            (teiCount / PaginationConstants.dataUploadPaginationLimit).ceil();
        for (int page = 0; page <= totalPages; page++) {
          if (_dataUploadStopped) {
            return;
          }
          var teiChunk =
              await _synchronizationService.getTeisFromOfflineDb(page: page);
          bool conflictOnImport = await _synchronizationService
              .uploadTeisToTheServer(teiChunk, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;
          profileCount = profileCount + (page / totalPages);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      // TODO: move the enrollments upload to a function
      var enrollmentCount =
          await _synchronizationService.getOfflineEnrollmentCount(currentUser!);
      if (enrollmentCount > 0) {
        int totalPages =
            (enrollmentCount / PaginationConstants.dataUploadPaginationLimit)
                .ceil();

        for (int page = 0; page <= totalPages; page++) {
          if (_dataUploadStopped) {
            return;
          }
          var enrollmentChunk = await _synchronizationService
              .getTeiEnrollmentFromOfflineDb(page: page);
          bool conflictOnImport = await _synchronizationService
              .uploadEnrollmentsToTheServer(enrollmentChunk, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;

          profileCount = profileCount + (page / totalPages);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      // TODO: move the relatioships upload to a function
      var teiRelationshipCount =
          await _synchronizationService.getOfflineRelationshipCount();
      if (teiRelationshipCount > 0) {
        int totalPages = (teiRelationshipCount /
                PaginationConstants.dataUploadPaginationLimit)
            .ceil();
        for (int page = 0; page <= totalPages; page++) {
          if (_dataUploadStopped) {
            return;
          }
          var teiRelationshipChunk = await _synchronizationService
              .getTeiRelationShipFromOfflineDb(page: page);
          bool conflictOnImport = await _synchronizationService
              .uploadTeiRelationToTheServer(teiRelationshipChunk, isAutoUpload);
          conflictOnTeisImport = conflictOnTeisImport || conflictOnImport;

          profileCount = profileCount + (page / totalPages);
          profileDataUploadProgress = profileCount / profileTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
        }
      } else {
        ++profileCount;
        profileDataUploadProgress = profileCount / profileTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }

      // TODO : move the events upload to a function
      var offlineEventCount =
          await _synchronizationService.getUnsyncedEventsCount();
      if (offlineEventCount > 0) {
        int totalPages =
            (offlineEventCount / PaginationConstants.dataUploadPaginationLimit)
                .ceil();
        for (int page = 0; page <= totalPages; page++) {
          if (_dataUploadStopped) {
            return;
          }
          var teiEventChunk = await _synchronizationService
              .getTeiEventsFromOfflineDb(page: page);
          bool conflictOnImport = await _synchronizationService
              .uploadTeiEventsToTheServer(teiEventChunk, isAutoUpload);
          conflictOnEventsImport = conflictOnEventsImport || conflictOnImport;

          eventsCount = eventsCount + (page / totalPages);
          eventsDataUploadProgress = eventsCount / eventsTotalCount;
          overallUploadProgress =
              (profileDataUploadProgress + eventsDataUploadProgress) / 2;
          notifyListeners();
        }
      } else {
        ++eventsCount;
        eventsDataUploadProgress = eventsCount / eventsTotalCount;
        overallUploadProgress =
            (profileDataUploadProgress + eventsDataUploadProgress) / 2;
        notifyListeners();
      }
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
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: 'startDataUploadActivity: ${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
    }
    notifyListeners();
    await startCheckingStatusOfUnsyncedData(isAutoUpload: isAutoUpload);
    notifyListeners();
    await Provider.of<ReferralNotificationState>(context!, listen: false)
        .reloadReferralNotifications();
    String lastDataUploadDate =
        AppUtil.formattedDateTimeIntoString(DateTime.now());
    await PreferenceProvider.setPreferenceValue(
        lastDataUploadDatePreferenceKey, lastDataUploadDate);
    Provider.of<SynchronizationStatusState>(context!, listen: false)
        .resetSyncStatusReferences();
  }

  Future syncReferralNotifications() async {
    AppUtil.showToastMessage(
      message: 'Start synchronization of referral notifications',
      position: ToastGravity.TOP,
    );
    int totalCount = 5;
    int count = 0;
    try {
      List<ReferralNotification> onlineReferralNotifications =
          await ReferralNotificationService()
              .discoveringReferralNotificationFromServer();
      ++count;
      _notificationProgress = count / totalCount;
      notifyListeners();

      List<ReferralNotification> offlineReferralNotifications =
          await ReferralNotificationService()
              .getReferralNotificationFromOffline();
      ++count;
      _notificationProgress = count / totalCount;
      notifyListeners();

      List<ReferralNotification> referralNotifications =
          ReferralNotificationService().getMergedReferralNotifications(
              onlineReferralNotifications, offlineReferralNotifications);
      ++count;
      _notificationProgress = count / totalCount;
      notifyListeners();

      await ReferralNotificationService()
          .savingReferralNotificationToOfflineDb(referralNotifications);
      ++count;
      _notificationProgress = count / totalCount;
      notifyListeners();

      await ReferralNotificationService()
          .updateReferralNotificationToServer(referralNotifications);
      ++count;
      _notificationProgress = count / totalCount;
      notifyListeners();
    } catch (error) {
      //
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
        .refreshOgacNumber();
    await Provider.of<EducationLbseInterventionState>(context!, listen: false)
        .refreshEducationLbseNumber();
    await Provider.of<PpPrevInterventionState>(context!, listen: false)
        .refreshPpPrevNumber();
    await Provider.of<EducationBursaryInterventionState>(context!,
            listen: false)
        .refreshEducationBursaryNumber();
  }
}
