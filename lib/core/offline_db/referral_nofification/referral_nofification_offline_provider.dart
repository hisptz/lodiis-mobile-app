import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_event_nofification_offline_provider.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';
import 'package:sqflite/sqflite.dart';

class ReferralNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final String table = "referral_notification";
  // columns
  final String id = "id";
  final String implementingPartner = "implementingPartner";
  final String nameSpaceKey = "nameSpaceKey";
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
      print(
          "addOrUpdateReferralNotification offline-provider : ${error.toString()}");
    }
  }

  Future<List<ReferralNotification>> getReferralNotifications() async {
    List<ReferralNotification> referralNotifications = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, implementingPartner, nameSpaceKey, tei],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          ReferralNotification referralNotification =
              ReferralNotification.fromJson(map);
          List<ReferralEventNotification> referrals =
              await ReferralEventNotificationOfflineProvider()
                  .getReferralEventNotification([referralNotification.tei]);
          referralNotification.referrals = referrals
              .where((ReferralEventNotification referral) =>
                  referral.nameSpaceKey == referralNotification.nameSpaceKey)
              .toList();
          referralNotifications.add(referralNotification);
        }
      }
    } catch (error) {
      print("getReferralNotifications : ${error.toString()}");
    }
    return referralNotifications
        .where((ReferralNotification referralNotification) =>
            referralNotification.referrals.length > 0)
        .toList();
  }
}
