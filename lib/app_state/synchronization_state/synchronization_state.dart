import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
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
  List<Enrollment> _enrollmentFromServer;
  List<TrackeEntityInstance> _trackeEntityInstance;
  List<dynamic> _servertrackedEntityInstance;

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
  List<Enrollment> get enrollmentFromServer => _enrollmentFromServer ?? [];
  List<TrackeEntityInstance> get trackedEntityInstanceFromServer =>
      _trackeEntityInstance ?? [];
  List<dynamic> get servertrackedEntityInstance =>
      _servertrackedEntityInstance ?? [];

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
    updateDataDownloadStatus(true);
    addDataDownloadProcess("Start Dowloading....");
    for (String orgUnitId in _synchronizationService.orgUnitIds) {
      for (String program in _synchronizationService.programs) {
        addDataDownloadProcess("get service data ....");
        _eventFromServer.addAll(await _synchronizationService
            .getEventsfromServer(program, orgUnitId));
        addDataDownloadProcess("get profile data ....");
        _servertrackedEntityInstance.addAll(await _synchronizationService
            .getTrackedInstancefromServer(program, orgUnitId));
      }
    }
    addDataDownloadProcess("finish Dowload");

    //todo analysis of data

//saving events;
    // addDataDownloadProcess("Saving service data ....");
    // for (Events events in _eventFromServer) {
    //   await _synchronizationService.saveEventsToOffline(events);
    // }
    // addDataDownloadProcess("Saving service data  complete");
    // addDataDownloadProcess("Saving profile data ....");

    // //saving profile data
    // for (var trackedEntityInstance in _servertrackedEntityInstance){
    //   TrackeEntityInstance trackeEntityInstance =
    //       TrackeEntityInstance().fromJson(trackedEntityInstance);
    //   await _synchronizationService.saveTrackeEntityInstanceToOffline(
    //   TrackeEntityInstance().fromJson(trackedEntityInstance));

    //   _synchronizationService
    //       .saveEnrollmentToOffline(trackedEntityInstance['enrollments']);
    // }
    // addDataDownloadProcess("Saving profile data complete");
    await analysisOfDownloadedData();
    updateDataDownloadStatus(false);
  }

  Future analysisOfDownloadedData() async {
    //online data here
    List dataDetails = servertrackedEntityInstance;
    //offline data here
    // List dataA = await _synchronizationService
    //     .getOfflineTrackedEntityAttributesValuesById();

    List<String> attributeIds = [];

    //get attributes
    for (var trackedEntityInstance in servertrackedEntityInstance) {
      TrackeEntityInstance trackeEntityInstance =
          TrackeEntityInstance().fromJson(trackedEntityInstance);
      attributeIds.add(trackeEntityInstance.attributes[0]['attribute']);
    }
//search and compare that does not exists in offline and save

//search for those contain conflicts

//it it has no conflict save them

//search attributes from offline

    List offlineTrackedEntityInstanceattributes = await _synchronizationService
        .getOfflineTrackedEntityAttributesValuesById(attributeIds);
    for (var trackedEntityInstance in servertrackedEntityInstance) {
      TrackeEntityInstance trackeEntityInstance =
          TrackeEntityInstance().fromJson(trackedEntityInstance);
          print(trackeEntityInstance.attributes[0]);
      if (offlineTrackedEntityInstanceattributes
          .contains(trackeEntityInstance.attributes[0]['attribute'])) {
        print("conflicts");
      }
      print("in start");
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
        }

        var teiEvents =
            await _synchronizationService.getTeiEventsFromOfflineDb();
        if (teiEvents.length > 0) {
          addDataUploadProcess("Uploading beneficiary's service data");
          await _synchronizationService.uploadTeiEventsToTheServer(teiEvents);
        }
      } catch (e) {}
      updateDataUploadStatus(false);
    }
  }
}
