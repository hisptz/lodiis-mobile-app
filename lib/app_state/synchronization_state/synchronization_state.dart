import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';

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

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive ?? false;
  bool get hasUnsyncedData => _hasUnsyncedData ?? false;
  bool get isUnsyncedCheckingActive => _isUnsyncedCheckingActive ?? false;
  bool get isDataDownloadingActive => _isDataDownloadingActive ?? false;
  int get beneficiaryCount => _beneficiaryCount ?? 0;
  int get beneficiaryServiceCount => _beneficiaryServiceCount ?? 0;
  List<String> get dataUploadProcesses => _dataUploadProcess ?? [];
  List<String> get dataDownloadProcesses => _dataDownloadProcess ?? [];

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
    _synchronizationService =
        SynchronizationService(user.username, user.password);
    var teis = await _synchronizationService.getTeisFromOfflineDb();
    var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
    _beneficiaryServiceCount = teiEvents.length;
    _beneficiaryCount = teis.length;
    _hasUnsyncedData = teiEvents.length > 0 || teis.length > 0;
    updateUnsynceDataCheckingStatus(false);
  }

  void startDataDownloadActivity() async {
    _dataDownloadProcess = [];
    updateDataDownloadStatus(true);
    Timer(Duration(seconds: 1), () => updateDataDownloadStatus(false));
  }

  void startDataUploadActivity() async {
    _dataUploadProcess = [];
    updateDataUploadStatus(true);
    addDataUploadProcess('Prepare offline data to upload');
    var teis = await _synchronizationService.getTeisFromOfflineDb();
    var teiEnrollments =
        await _synchronizationService.getTeiEnrollmentFromOfflineDb();
    addDataUploadProcess("Uploading beneficiary's profile data");
    await _synchronizationService.uploadTeisToTheServer(teis);
    await _synchronizationService
        .uploadTeiEnrollmentToTheServer(teiEnrollments);
    // @TODO uploading relationships
    addDataUploadProcess(
        "Beneficiary's profile data have been uploaded successfully");
    var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
    addDataUploadProcess("Uploading beneficiary's service data");
    await _synchronizationService.uploadTeiEventsToTheServer(teiEvents);
    addDataUploadProcess(
        "Beneficiary's services data have been uploaded successfully");
    Timer(Duration(seconds: 1), () {
      updateDataUploadStatus(false);
      addDataUploadProcess("Data upload have been completed successfully");
    });
  }
}
