import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/referral_event_notification.dart';
import 'package:sqflite/sqflite.dart';

class ReferralEventNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final String table = "referral_event_notification";
  // column\
  final String id = "id";
  final String tei = "tei";
  final String nameSpaceKey = "nameSpaceKey";
  final String fromImplementingPartner = "fromImplementingPartner";
  final String isCompleted = "isCompleted";
  final String isViewed = "isViewed";

  addOrUpdateReferralEventNotification(
    List<ReferralEventNotification> referralEvents,
  ) async {
    try {
      var dbClient = await db;
      var dbClientBatch = dbClient!.batch();
      for (ReferralEventNotification referralEventNotification
          in referralEvents) {
        Map data = referralEventNotification.toOffline();
        dbClientBatch.insert(
          table,
          data as Map<String, Object?>,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await dbClientBatch.commit(
        continueOnError: true,
        noResult: true,
        exclusive: true,
      );
    } catch (error) {
      print("addOrUpdateReferralEventNotification : ${error.toString()}");
    }
  }

  Future<List<ReferralEventNotification>> getReferralEventNotification(
    List<String?> teiIds,
  ) async {
    List<ReferralEventNotification> referralEvents = [];
    try {
      var dbClient = await db;
      String questionMarks = teiIds.map((e) => '?').toList().join(',');
      List<Map> maps = await dbClient!.query(
        table,
        columns: [
          id,
          tei,
          nameSpaceKey,
          fromImplementingPartner,
          isCompleted,
          isViewed,
        ],
        where: '$tei IN ($questionMarks)',
        whereArgs: teiIds,
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          referralEvents.add(ReferralEventNotification.fromJson(map));
        }
      }
    } catch (error) {
      print("getReferralEventNotification : ${error.toString()}");
    }
    return referralEvents;
  }
}
