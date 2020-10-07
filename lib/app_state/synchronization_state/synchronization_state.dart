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

// selectors
  bool get isDataUploadingActive => _isDataUploadingActive ?? false;
  bool get hasUnsyncedData => _hasUnsyncedData ?? false;
  bool get isUnsyncedCheckingActive => _isUnsyncedCheckingActive ?? false;
  bool get isDataDownloadingActive => _isDataDownloadingActive ?? false;

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

  void startCheckingStatusOfUnsyncedData() async {
    updateUnsynceDataCheckingStatus(true);
    CurrentUser user = await UserService().getCurrentUser();
    _synchronizationService =
        SynchronizationService(user.username, user.password);
    var teis = await _synchronizationService.getTeisFromOfflineDb();
    var teiEvents = await _synchronizationService.getTeiEventsFromOfflineDb();
    _hasUnsyncedData = teiEvents.length > 0 || teis.length > 0;
    updateUnsynceDataCheckingStatus(false);
  }

  void startDataDownloadActivity() async {
    updateDataDownloadStatus(true);
    Timer(Duration(seconds: 1), () => updateDataDownloadStatus(false));
  }

  void startDataUploadActivity() async {
    updateDataUploadStatus(true);
    // start actual process
    Timer(Duration(seconds: 1), () => updateDataUploadStatus(false));
  }
}
