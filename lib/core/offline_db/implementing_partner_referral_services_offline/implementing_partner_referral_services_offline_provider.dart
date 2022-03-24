import 'package:kb_mobile_app/models/implementing_partner_referral_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class ImplementingPartnerReferralServicesOfflineProvider
    extends OfflineDbProvider {
  final String table = 'implementing_partner_referral_Services';

  // columns
  final String id = 'id';
  final String services = 'services';

  Future<void> addOrUpdateReferralServices(
      ImplementingPartnerReferralService referralService) async {
    var dbClient = await db;
    try {
      Map data =
          ImplementingPartnerReferralService().toOffline(referralService);
      await dbClient!.insert(table, data as Map<String, Object?>,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      //
    }
  }

  Future<bool> checkIfImplementingPartnerReferralServicesExist() async {
    List<Map> appLogs = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient!.query(table, columns: [id]);
      appLogs.addAll(maps);
    } catch (e) {
      //
    }

    return appLogs.isNotEmpty;
  }

  Future<String?> getImplementingPartnerReferralServices(
      String serviceId) async {
    List<ImplementingPartnerReferralService> referralServices = [];
    try {
      var dbClient = await db;
      List<Map> mapeServices = await dbClient!.query(table,
          columns: [services], where: '$id = ?', whereArgs: [serviceId]);
      if (mapeServices.isNotEmpty) {
        for (Map mapeService in mapeServices) {
          ImplementingPartnerReferralService service =
              ImplementingPartnerReferralService.fromOffline(
                  mapeService as Map<String, dynamic>);
          referralServices.add(service);
        }
      }
      if (referralServices.isNotEmpty) {
        return referralServices[0].services;
      } else {
        return '';
      }
    } catch (e) {
      //
      return '';
    }
  }
}
