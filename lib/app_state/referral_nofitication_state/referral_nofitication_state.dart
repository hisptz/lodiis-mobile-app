import 'package:flutter/foundation.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';

class ReferralNotificationState with ChangeNotifier {
  // initial state
  String _currentImplementingPartner;
  List<String> _beneficiariesWithIncomingReferrals;
  List<String> _incommingReferrals;
  List<ReferralEventNotification> _incommingResolvedReferrals;
  String _incomingReferralToResolveIndicator;
  String _incomingReferralsResolvedIndicator;

  // Selectors
  String get currentImplementingPartner => _currentImplementingPartner ?? "";
  List<String> get beneficiariesWithIncomingReferrals =>
      _beneficiariesWithIncomingReferrals ?? [];
  List<String> get incomingReferrals => _incommingReferrals ?? [];
  List<ReferralEventNotification> get incommingResolvedReferrals =>
      _incommingResolvedReferrals ?? [];
  String get incomingReferralsResolvedIndicator =>
      _incomingReferralsResolvedIndicator ?? "";
  String get incomingReferralToResolveIndicator =>
      _incomingReferralToResolveIndicator ?? "";
  List<String> get teiWithIncommingResolvedReferrals =>
      getListOfTeiWithIncomingResolvedReferrals();

  List<String> getListOfTeiWithIncomingResolvedReferrals() {
    List<String> teiList = [];
    _incommingResolvedReferrals.forEach((referral) {
      teiList.add(referral.tei);
    });
    return teiList.toSet().toList();
  }

  // reducer for the state
  Future<void> setCurrentImplementingPartner(String implementingPartner) async {
    _currentImplementingPartner = implementingPartner.split("/").join("-");
    notifyListeners();
    await reloadReferralNotifications();
  }

  Future<void> reloadReferralNotifications() async {
    _beneficiariesWithIncomingReferrals = [];
    _incommingReferrals = [];
    _incommingResolvedReferrals = [];
    int incomingReferralToResolveCount = 0;
    int incomingReferralsResolvedCount = 0;
    List<String> offlineTrackedEntityInstanceIds =
        await TrackedEntityInstanceOfflineProvider()
            .getAllOfflineTrackedEntitiyInstanceIds();
    List<ReferralNotification> allReferralNofications =
        await ReferralNotificationService()
            .getReferralNotificationFromOffline();
    for (ReferralNotification referralNotification in allReferralNofications) {
      if (offlineTrackedEntityInstanceIds.isNotEmpty &&
          offlineTrackedEntityInstanceIds.contains(referralNotification.tei)) {
        if (referralNotification.implementingPartner ==
            _currentImplementingPartner) {
          List<ReferralEventNotification> referrals = referralNotification
              .referrals
              .where(
                  (ReferralEventNotification referral) => !referral.isCompleted)
              .toList();
          incomingReferralToResolveCount += referrals.length;
          if (referrals.isNotEmpty) {
            _beneficiariesWithIncomingReferrals.add(referralNotification.tei);
            _incommingReferrals.addAll(referrals
                .map((ReferralEventNotification referral) => referral.id ?? "")
                .toList());
          }
        } else {
          _incommingResolvedReferrals.addAll(referralNotification.referrals
              .where((ReferralEventNotification referral) =>
                  referral.isCompleted &&
                  !referral.isViewed &&
                  referral.fromImplementingPartner ==
                      _currentImplementingPartner)
              .toList());
        }
      }
    }
    incomingReferralsResolvedCount = _incommingResolvedReferrals.length;
    _beneficiariesWithIncomingReferrals =
        _beneficiariesWithIncomingReferrals.toSet().toList();
    _incommingReferrals = _incommingReferrals.toSet().toList();
    _incomingReferralsResolvedIndicator = incomingReferralsResolvedCount == 0
        ? ""
        : incomingReferralsResolvedCount > 9
            ? "9+"
            : "$incomingReferralsResolvedCount";
    _incomingReferralToResolveIndicator = incomingReferralToResolveCount == 0
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
