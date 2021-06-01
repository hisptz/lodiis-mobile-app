import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/models/app_logs.dart';

class AppLogsService {
  Future<void> saveLogs(AppLogs appLog) async {
    await AppLogsOfflineProvider().addLogs(appLog);
  }

  Future<List<AppLogs>> getAppLogs(
      {int page, String searchableValue = ''}) async {
    List<AppLogs> appLogsList = [];
    try {
      List<AppLogs> appLogs =
          await AppLogsOfflineProvider().getLogs(page: page);
      appLogsList.addAll(appLogs);
    } catch (e) {}

    return searchableValue == ''
        ? appLogsList
        : appLogsList
            .where((AppLogs logs) =>
                logs.searchableValue
                    .toLowerCase()
                    .indexOf(searchableValue.toLowerCase()) !=
                -1)
            .toList();
  }

  Future<int> getAppLogsCount() async {
    return await AppLogsOfflineProvider().getAppLogsCount();
  }
}
