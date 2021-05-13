import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:sqflite/sqflite.dart';

class ReferralEventNotificationOfflineProvider extends OfflineDbProvider {
  // table name
  final table = "referrak_event_notification";
  // columns
  String id = "id";
  String tei = "tei";
  String isCompleted = "isCompleted";

  addOrUpdateReferralEventNotification(
    List<ReferralEventNotification> referralEvents,
  ) async {
    try {
      var dbClient = await db;
      var dbClientBatch = dbClient.batch();
      for (ReferralEventNotification referralEventNotification
          in referralEvents) {
        Map data = referralEventNotification.toOffline();
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
    } catch (error) {
      print(error);
    }
  }
}
