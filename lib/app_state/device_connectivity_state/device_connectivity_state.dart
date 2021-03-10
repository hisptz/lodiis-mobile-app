import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';

class DeviceConnectivityState with ChangeNotifier {
  // initial state
  bool _isConnectedToNetwork = false;
  // selectors
  bool get connectivityStatus => _isConnectedToNetwork;

  // reducers
  void changeConnectivityStatus({bool isConnected}) {
    _isConnectedToNetwork = isConnected;
    notifyListeners();
  }

  void initializeConnectionStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _isConnectedToNetwork = connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
    notifyListeners();
  }
}
