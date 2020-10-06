import 'package:flutter/foundation.dart';

class SynchronizationState with ChangeNotifier {
// intial state
  bool _isSynchronizationActive;

// selectors
  bool get isSynchronizationActive => _isSynchronizationActive ?? false;

// reducers
  void updateSynchronizationActiveStatus(bool status) {
    _isSynchronizationActive = status;
    notifyListeners();
  }
}
