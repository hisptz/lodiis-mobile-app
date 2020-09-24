import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class EventOfflineProvider extends OfflineDbProvider {
  final String table = 'events';
  //columns
  final String event = 'event';
  final String eventDate = 'eventDate';
  final String program = 'program';
  final String programStage = 'programStage';
  final String trckedEntityInstance = 'trckedEntityInstance';
  final String status = 'status';
  final String orgUnit = 'orgUnit';
  final String syncStatus = 'syncStatus';
}
