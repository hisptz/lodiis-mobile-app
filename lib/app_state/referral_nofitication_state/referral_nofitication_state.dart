import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationState with ChangeNotifier {
  // initial state
  String _currentImplementingPartner;
  List<String> _beneficiariesWithIncomingReferrals;
  List<String> _incommingReferrals;
  String _incomingReferralToResolve;
  String _incomingReferralsResolved;

  // Selectors
  String get currentImplementingPartner => _currentImplementingPartner ?? "";
  List<String> get beneficiariesWithIncomingReferrals =>
      _beneficiariesWithIncomingReferrals ?? [];
  List<String> get incomingReferrals => _incommingReferrals ?? [];
  String get incomingReferralsResolved => _incomingReferralsResolved ?? "";
  String get incomingReferralToResolve => _incomingReferralToResolve ?? "";

  // reducer for the state
  Future<void> setCurrentImplementingPartner(String implementingPartner) async {
    _currentImplementingPartner = implementingPartner.split("/").join("-");
    notifyListeners();
    await reloadReferralNotifications();
  }

  Future<void> reloadReferralNotifications() async {
    _beneficiariesWithIncomingReferrals = [];
    _incommingReferrals = [];
    int incomingReferralToResolveCount = 0;
    int incomingReferralsResolvedCount = 0;
    // TrackedEntityInstanceOfflineProvider //
    List<ReferralNotification> allReferralNofications =
        await ReferralNotificationService()
            .getReferralNotificationFromOffline();
    for (ReferralNotification referralNotification in allReferralNofications) {
      if (referralNotification.implementingPartner ==
          _currentImplementingPartner) {
        List<ReferralEventNotification> referrals = referralNotification
            .referrals
            .where(
                (ReferralEventNotification referral) => !referral.isCompleted)
            .toList();
        incomingReferralToResolveCount += referrals.length;
        if (referrals.length > 0) {
          _beneficiariesWithIncomingReferrals.add(referralNotification.tei);
          _incommingReferrals.addAll(referrals
              .map((ReferralEventNotification referral) => referral.id ?? "")
              .toList());
        }
      } else {
        List<ReferralEventNotification> referrals = referralNotification
            .referrals
            .where((ReferralEventNotification referral) =>
                referral.isCompleted && referral.isViewed)
            .toList();
        incomingReferralsResolvedCount += referrals.length;
      }
    }
    _beneficiariesWithIncomingReferrals =
        _beneficiariesWithIncomingReferrals.toSet().toList();
    _incommingReferrals = _incommingReferrals.toSet().toList();
    _incomingReferralsResolved = incomingReferralsResolvedCount == 0
        ? ""
        : incomingReferralsResolvedCount > 9
            ? "9+"
            : "$incomingReferralsResolvedCount";
    _incomingReferralToResolve = incomingReferralToResolveCount == 0
        ? ""
        : incomingReferralToResolveCount > 9
            ? "9+"
            : "$incomingReferralToResolveCount";
    notifyListeners();
  }

  updateReferralNotificaionEvent(
    String referralEventId,
    String tei,
    bool isCompleted,
    bool isViewed,
  ) async {
    await ReferralNotificationService().updateReferralNotificaionEvent(
      referralEventId,
      tei,
      isCompleted,
      isViewed,
    );
    reloadReferralNotifications();
  }
}
