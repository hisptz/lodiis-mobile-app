import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class SynchronizationState with ChangeNotifier {
// intial state
  bool _isDataUploadingActive;
  bool _isDataDownloadingActive;
  bool _hasUnsyncedData;
  bool _isUnsyncedCheckingActive = true;
  SynchronizationService _synchronizationService;
  int _beneficiaryCount;
  int _beneficiaryServiceCount;
  List<String> _dataDownloadProcess;
  List<String> _dataUploadProcess;
  List<Events> _eventFromServer;
  List<TrackeEntityInstance> _trackeEntityInstance;
  List<dynamic> _servertrackedEntityInstance;
  Map<String, List> _trackedInstance;
  Map<String, List> _events;
  Map<String, List> _relationships;
  List<Map<String, dynamic>> _events_1;
  List<Map<String, dynamic>> _trackedInstance1;
  int _conflictLCount = 0;

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive ?? false;

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

  void startCheckingStatusOfUnsyncedData() async {
    _dataDownloadProcess = [];
    _dataUploadProcess = [];
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
    updateDataDownloadStatus(true);
    addDataDownloadProcess("Start Downloading....");
    int count = 0;
    int total = _synchronizationService.orgUnitIds.length *
        _synchronizationService.programs.length;
    for (String orgUnitId in _synchronizationService.orgUnitIds) {
      for (String program in _synchronizationService.programs) {
        count++;
        addDataDownloadProcess("Download profile data $count/$total");
        servertrackedEntityInstance.addAll(await _synchronizationService
            .getTrackedInstancefromServer(program, orgUnitId));
      }
    }
    count = 0;
    for (String orgUnitId in _synchronizationService.orgUnitIds) {
      for (String program in _synchronizationService.programs) {
        count++;
        addDataDownloadProcess("Download service data $count/$total");
        _eventFromServer.addAll(await _synchronizationService
            .getEventsfromServer(program, orgUnitId));
      }
    }

    addDataDownloadProcess("Download Complete");
    // await analysisOfDownloadedData();
    await saveAllData();
  }

  Future saveAllData() async {
    await saveEventsToOffline();
    await saveTrackedEntityStateToOffline();
    AppUtil.showToastMessage(message: 'Download successful');
    updateDataDownloadStatus(false);
  }

  Future saveEventsToOffline() async {
    addDataDownloadProcess('Saving Events');
    for (Events event in eventFromServer) {
      await _synchronizationService.saveEventsToOffline(event);
    }
  }

  Future saveTrackedEntityStateToOffline() async {
    addDataDownloadProcess('Saving Profiles');
    for (var instance in servertrackedEntityInstance) {
      try {
        await _synchronizationService
            .saveEnrollmentToOffline(instance['enrollments']);
        await _synchronizationService
            .saveRelationshipsToOffline(instance['relationships']);
        await _synchronizationService.saveTrackeEntityInstanceToOffline(
            TrackeEntityInstance().fromJson(instance));
      } catch (e) {
        // print(e.toString());
      }
    }
  }

  Future analysisOfDownloadedData() async {
    addDataDownloadProcess("Start analyse service data ");
    await eventsAnalysisDownloadData();
    addDataDownloadProcess("Start analyse profile data ");
    await trackeEntityInstanceAnalysisDownloadData();
    addDataDownloadProcess('Saving relationships');
    updateDataDownloadStatus(false);
  }

  Future eventsAnalysisDownloadData() async {
    List<Events> offLineNonSyncEvents =
        await _synchronizationService.getTeiEventsFromOfflineDb();
    List offEventsAttributes = [];
    List onlineEventsAttributes = [];
    List offlineEventsToResolve = [];
    List onlineEventsToResolve = [];

//get data value id which are not sync
    for (Events event in offLineNonSyncEvents) {
      offEventsAttributes.addAll(event.dataValues);
    }
//get data value id from online
    for (Events event in eventFromServer) {
      onlineEventsAttributes.addAll(event.dataValues);
      offEventsAttributes.forEach((offlinEventAttribute) {
        if (!onlineEventsAttributes.contains(offlinEventAttribute)) {
          //contain conflicts
          offlineEventsToResolve.add(offlinEventAttribute);
          onlineEventsToResolve.addAll(onlineEventsAttributes
              .where((onlineEventAttribute) =>
                  offlinEventAttribute['dataElement'] ==
                      onlineEventAttribute['dataElement'] &&
                  offlinEventAttribute['value'] !=
                      onlineEventAttribute['value'])
              .toList());
        } else {
          //no conflicts
          // print("no conflicts");
          // print(event);
          _synchronizationService.saveEventsToOffline(event);
        }
      });
    }
    _events = {
      "online": onlineEventsToResolve,
      "offline": offlineEventsToResolve,
    };
  }

  Future trackeEntityInstanceAnalysisDownloadData() async {
    List<String> attributeIds = [];
    _trackedInstance1 = [];

    //get attributes
    for (var trackedEntityInstance in servertrackedEntityInstance) {
      TrackeEntityInstance trackeEntityInstance =
          TrackeEntityInstance().fromJson(trackedEntityInstance);
      attributeIds.add(trackeEntityInstance.attributes[0]['attribute']);
    }
    List offlineTrackedEntityInstanceattributes = await _synchronizationService
        .getOfflineTrackedEntityAttributesValuesById(attributeIds);
    for (var _trackedEntityInstance in servertrackedEntityInstance) {
      TrackeEntityInstance trackeEntityInstance =
          TrackeEntityInstance().fromJson(_trackedEntityInstance);

      if (offlineTrackedEntityInstanceattributes == null ||
          offlineTrackedEntityInstanceattributes.length < 1) {
        await _synchronizationService
            .saveTrackeEntityInstanceToOffline(trackeEntityInstance);
        await _synchronizationService
            .saveEnrollmentToOffline(_trackedEntityInstance['enrollments']);
      } else {
        //consider sync and unsync data comparison
        offlineTrackedEntityInstanceattributes
            .forEach((trackedAttribute) async {
          if (trackedAttribute['attribute'] ==
                  trackeEntityInstance.attributes[0]['attribute'] &&
              trackedAttribute['value'] !=
                  trackeEntityInstance.attributes[0]['value']) {
            // _conflictLCount++;
            _trackedInstance1.add({
              "label": trackeEntityInstance.attributes[0]['displayName'],
              "trackeEntityInstance": trackeEntityInstance,
              "offline": trackedAttribute['value'],
              "online": trackeEntityInstance.attributes[0]['value']
            });
          } else {
            // Save data when no conflicts
            await _synchronizationService
                .saveTrackeEntityInstanceToOffline(trackeEntityInstance);
            await _synchronizationService
                .saveEnrollmentToOffline(_trackedEntityInstance['enrollments']);
          }
        });
      }
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
        // @TODO uploading relationships
        var teiRelationships =
            await _synchronizationService.getTeiRelationShipFromOfflineDb();
        await _synchronizationService
            .uploadTeiRelationToTheServer(teiRelationships);
      }

      var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
      if (teiEvents.length > 0) {
        addDataUploadProcess("Uploading beneficiary's service data");
        await _synchronizationService.uploadTeiEventsToTheServer(teiEvents);
      }
    } catch (e) {}
    updateDataUploadStatus(false);
  }
}
