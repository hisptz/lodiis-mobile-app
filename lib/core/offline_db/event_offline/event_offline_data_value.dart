import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class EventOfflineDataValueProvider extends OfflineDbProvider {
  final String table = 'event_data_value';
  //columns
  final String id = 'id';
  final String event = 'event';
  final String dataElement = 'dataElement';
  final String value = 'program';
}
