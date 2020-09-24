import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class TrackedEntityInstanceOfflineProvider extends OfflineDbProvider {
  final String table = 'tracked_entity_instance';
  //columns
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String trackedEntityType = 'trackedEntityType';
  final String orgUnit = 'orgUnit';
  final String syncStatus = 'syncStatus';
}
