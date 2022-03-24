import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:sqflite/sqflite.dart';

class FormAutoSaveOfflineProvider extends OfflineDbProvider {
  //table name
  final String table = "form_auto_save";

  //columns
  final String id = "id";
  final String beneficiaryId = "beneficiaryId";
  final String pageModule = "pageModule";
  final String nextPageModule = "nextPageModule";
  final String data = "data";

  addOrUpdateFormAutoSaveFormData(FormAutoSave formAutoSave) async {
    try {
      var dbClient = await db;
      Map data = FormAutoSave().toOffline(formAutoSave);
      await dbClient!.insert(
        table,
        data as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      //
    }
  }

  Future deleteSavedFormAutoFormData(
    String? formAutoSaveId,
  ) async {
    try {
      var dbClient = await db;
      dbClient!.delete(
        table,
        where: '$id = ?',
        whereArgs: [formAutoSaveId],
      );
    } catch (e) {
      //
    }
  }

  Future<FormAutoSave> getSavedFormAutoSaveFormDataById(
    String formAutoSaveId,
  ) async {
    List<FormAutoSave> formAutoSaveList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient!.query(
        table,
        columns: [
          id,
          beneficiaryId,
          pageModule,
          nextPageModule,
          data,
        ],
        where: '$id = ?',
        whereArgs: [formAutoSaveId],
      );
      if (maps.isNotEmpty) {
        for (Map mapData in maps) {
          formAutoSaveList
              .add(FormAutoSave.fromOffline(mapData as Map<String, dynamic>));
        }
      }
    } catch (e) {
      //
    }
    return formAutoSaveList.isNotEmpty
        ? formAutoSaveList.first
        : FormAutoSave(id: formAutoSaveId);
  }
}
