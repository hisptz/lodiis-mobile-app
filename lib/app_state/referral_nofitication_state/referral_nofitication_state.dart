import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';

class ReferralNotificationState with ChangeNotifier {
  // initial state

  // Selectors

  // reducer for the state

  updateReferralNotificaionEvent(String referralEventId, String tei) async {
    await ReferralNotificationService()
        .updateReferralNotificaionEvent(referralEventId, tei);
    notifyListeners();
  }
}
