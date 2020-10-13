import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/reserved_value.dart';
import 'package:sqflite/sqlite_api.dart';

class ReserveValueOffline extends OfflineDbProvider {
  String reservedValueTable = 'reserve_value';
  String id = 'id';
  String attribute = 'attribute';
  String value = 'value';
  String expireDate = 'expireDate';

  addOrUpdateReservedValue(List<ReservedValue> reservedValues) async {
    var dbClient = await db;
    for (ReservedValue reservedValue in reservedValues) {
      await dbClient.insert(
          reservedValueTable, reservedValue.toOffline(reservedValue),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<ReservedValue>> getReserveValue() async {
    List<ReservedValue> reserveValues = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        reservedValueTable,
        columns: [
          id,
          attribute,
          value,
          expireDate,
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          reserveValues.add(ReservedValue.fromOffline(map));
        }
      }
    } catch (e) {}
    return reserveValues;
  }

  deleteExpireReserveValue(List<String> reservedValueId) async {
    var dbClient = await db;
    String questionMark = reservedValueId.map((e) => '?').toList().join(',');
    return await dbClient.delete(reservedValueTable,
        where: '$id IN ($questionMark)', whereArgs: reservedValueId);
  }
}
