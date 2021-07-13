import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
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
      List<AppLogs> refactoredAppLogs = appLogs.map((log) {
        log.message = getFormattedMessage(log.message ?? '');
        return log;
      }).toList();
      appLogsList.addAll(refactoredAppLogs);
    } catch (e) {
      print('Error: $e');
    }

    return searchableValue == ''
        ? appLogsList
        : appLogsList
            .where((AppLogs logs) => AppUtil().searchFromString(
                searchableString: logs.searchableValue,
                searchedValue: searchableValue))
            .toList();
  }

  Future<List<Map>> getAllAppLogs() async {
    List<Map> appLogsList = [];
    try {
      List<AppLogs> appLogs = await AppLogsOfflineProvider().getLogs();
      List<Map> refactoredAppLogs = appLogs.map((log) {
        return AppLogs().toOffline(log);
      }).toList();
      appLogsList.addAll(refactoredAppLogs);
    } catch (e) {
      print('Error: $e');
    }
    return appLogsList;
  }

  String getFormattedMessage(String message) {
    String formattedMessage = '';
    try {
      RegExp connectionRegex = RegExp(r"(timed out)");
      RegExp accessRegex = RegExp(r"(access)");
      RegExp enrollmentRegex = RegExp(r"(not enrolled)");
      RegExp socketRegex = RegExp(r"(SocketException)");
      RegExp eventForTeiNotExistRegex = RegExp(
          r"Event.trackedEntityInstance does not point to a valid tracked entity instance");
      RegExp eventForStageNotExistRegex =
          RegExp(r"Event.programStage does not point to a valid programStage");
      RegExp attributeRegEx = RegExp(r"Attribute.value");
      RegExp notValidRegEx = RegExp(r"is not a valid");

      // Check for possible error messages
      if (socketRegex.hasMatch(message)) {
        formattedMessage = 'Internet connection error';
      } else if (accessRegex.hasMatch(message)) {
        formattedMessage = 'Current user has no proper access';
      } else if (enrollmentRegex.hasMatch(message)) {
        String program = getProgramName(message);
        formattedMessage = 'Beneficiaries not enrolled to$program program.';
      } else if (connectionRegex.hasMatch(message)) {
        formattedMessage = 'Failed to connect to the server';
      } else if (eventForTeiNotExistRegex.hasMatch(message)) {
        formattedMessage =
            'Can not upload services for unenrolled beneficiaries';
      } else if (eventForStageNotExistRegex.hasMatch(message)) {
        formattedMessage = 'Can not upload services for unknown intervention';
      } else if (attributeRegEx.hasMatch(message) ||
          notValidRegEx.hasMatch(message)) {
        formattedMessage = 'Attribute has invalid value type';
      } else {
        formattedMessage = message;
      }
    } catch (e) {
      formattedMessage = message;
    }
    return formattedMessage;
  }

  String getProgramName(String message) {
    // program list with their uids
    Map programs = {
      "dwtPhZrg2k7": "OGAC",
      "hOEIHJDrrvz": "AGYW/DREAMS",
      "M4uWNFJNMIR": "AGYW/Dreams None Participation Form",
      "AxscuxwznKK": "None Participation to Programme",
      "BNsDaCclOiu": "Caregiver",
      "CK4iMK8b0aZ": "NON-AGYW/DREAMS",
      "em38qztTI8s": "OVC",
    };

    String program = '';
    programs.forEach((id, name) {
      print(name);
      if (message.contains(id)) {
        program = ' $name';
      }
    });

    return program;
  }

  Future<int> getAppLogsCount() async {
    return await AppLogsOfflineProvider().getAppLogsCount();
  }
}
