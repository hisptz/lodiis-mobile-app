import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class TrackedEntityInstanceOfflineAttributeProvider extends OfflineDbProvider {
  final String table = 'tracked_entity_instance_attribute';
  //columns
  final String id = 'id';
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String attribute = 'attribute';
  final String value = 'value';

  var d =
      "CREATE TABLE IF NOT EXISTS tracked_entity_instance_attribute (id TEXT PRIMARY KEY,  trackedEntityInstance TEXT,attribute TEXT, value TEXT)";
}
