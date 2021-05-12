import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class ReferralNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final table = "referral_notification";
  // columns
  final String id = "id";
  final String implementingPartner = "implementingPartner";
  final String location = "location";
  final String tei = "tei";

  addOrUpdateReferralNotification() async {}
}
