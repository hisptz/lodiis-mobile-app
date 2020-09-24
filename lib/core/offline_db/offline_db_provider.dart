import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OfflineDbProvider {
  final String databaseName = "kb_mobile_app";
  Database _db;
  // Script for migrations as well as intialization of tables
  final List<String> initialQuery = [
    "CREATE TABLE IF NOT EXISTS current_user (id TEXT PRIMARY KEY, name TEXT, username TEXT, password TEXT ,isLogin INTEGER)",
    "CREATE TABLE IF NOT EXISTS current_user_ou (id TEXT PRIMARY KEY, userId TEXT)",
    "CREATE TABLE IF NOT EXISTS current_user_program (id TEXT PRIMARY KEY, userId TEXT)",
    "CREATE TABLE IF NOT EXISTS organisation_unit (id TEXT PRIMARY KEY, name TEXT, parent TEXT, level NUMBER)",
    "CREATE TABLE IF NOT EXISTS organisation_unit_children (id TEXT PRIMARY KEY, organisationId TEXT)"
  ];

  final List<String> migrationQuery = [
    "DROP TABLE organisation_unit_program",
    "CREATE TABLE IF NOT EXISTS organisation_unit_program (id TEXT PRIMARY KEY ,programId TEXT, organisationId TEXT)"
  ];

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this.onCreate(_db, migrationQuery.length + 1);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    return await openDatabase(
      path,
      version: migrationQuery.length + 1,
      onUpgrade: onUpgrade,
      onCreate: onCreate,
    );
  }

  onCreate(Database db, int version) async {
    for (String query in initialQuery) {
      await db.execute(query);
    }
  }

  onUpgrade(Database db, int oldVersion, int version) async {
    for (String query in migrationQuery) {
      await db.execute(query);
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
