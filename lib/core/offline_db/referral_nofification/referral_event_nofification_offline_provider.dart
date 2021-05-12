import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';

class ReferralEventNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final table = "referrak_event_notification";
  // columns
  String id = "id";
  String tei = "tei";
  String isCompleted = "isCompleted";

  addOrUpdateReferralEventNotification(
    List<ReferralEventNotification> referralEvents,
  ) async {}
}
