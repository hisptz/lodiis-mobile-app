import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class LogsOfflineProvider extends OfflineDbProvider {
  final String table = 'app_logs';
  // columns
  final String id = 'id';
  final String type = 'type';
  final String message = 'message';
  final String date = 'date';
}
