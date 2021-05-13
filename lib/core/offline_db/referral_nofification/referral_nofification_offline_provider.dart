import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_event_nofification_offline_provider.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';
import 'package:sqflite/sqflite.dart';

class ReferralNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final table = "referral_notification";
  // columns
  final String id = "id";
  final String implementingPartner = "implementingPartner";
  final String location = "location";
  final String tei = "tei";

  addOrUpdateReferralNotification(
    List<ReferralNotification> referralNotifications,
  ) async {
    List<ReferralEventNotification> referralEvents = [];
    try {
      var dbClient = await db;
      var dbClientBatch = dbClient.batch();
      for (ReferralNotification referralNotification in referralNotifications) {
        referralEvents.addAll(referralNotification.referrals);
        Map data = referralNotification.toOffline();
        data.remove('referrals');
        dbClientBatch.insert(
          table,
          data,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await dbClientBatch.commit(
        continueOnError: true,
        noResult: true,
        exclusive: true,
      );
      await ReferralEventNotificationOfflineProvider()
          .addOrUpdateReferralEventNotification(referralEvents);
    } catch (error) {
      print(error);
    }
  }
}
