import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class CurrentUserState with ChangeNotifier {
  // initiat state
  CurrentUser _currentUser;

  // selectors
  CurrentUser get currentUser => _currentUser;

  //reducers
  void setCurrentUser(CurrentUser user) {
    _currentUser = user;
    notifyListeners();
  }
}
