import 'dart:convert';

import 'package:http/http.dart';
import 'package:kb_mobile_app/core/constants/app_logs_constants.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/synchronization_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class TrackedEntityInstanceService {
  Future discoverTrackedEntityInstanceById(String teiId) async {
    try {
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      HttpService httpService = HttpService(
        username: currentUser!.username,
        password: currentUser.password,
      );
      var url = "api/trackedEntityInstances/$teiId.json";
      List<String> programs = await discoveringBeneficiaryPrograms(teiId);
      for (String program in programs) {
        var queryParameters = {
          "program": program,
          "fields":
              "trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value,displayName],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status,events[event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value,displayName],eventDate]],relationships[relationshipType,relationship,from[trackedEntityInstance[trackedEntityInstance]],to[trackedEntityInstance[trackedEntityInstance]]]"
        };
        var response =
            await httpService.httpGet(url, queryParameters: queryParameters);
        if (response.statusCode == 200) {
          Map<String, dynamic> teiJson = json.decode(response.body);
          List teiEnrollmentsJson = teiJson["enrollments"] ?? [];
          List teiRelationshipsJson = teiJson["relationships"] ?? [];
          List teiEventsJson = [];
          for (var enrollment in teiEnrollmentsJson) {
            teiEventsJson.addAll(enrollment["events"] ?? []);
          }
          String searchableValue =
              TrackedEntityInstanceUtil.getEnrollmentSearchableValue(teiJson);
          for (var enrollment in teiEnrollmentsJson) {
            enrollment["searchableValue"] = searchableValue;
          }
          await saveTrackedEntityInstanceProfile(teiJson);
          await saveTrackedEntityInstanceEnrollment(teiEnrollmentsJson);
          await saveTrackedEntityInstanceEvents(teiEventsJson);
          await saveTrackedEntityInstanceRelationShips(teiRelationshipsJson);
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  Future saveTrackedEntityInstanceProfile(dynamic teiJson) async {
    await TrackedEntityInstanceOfflineProvider()
        .addOrUpdateTrackedEntityInstance(
            TrackedEntityInstance().fromJson(teiJson));
  }

  Future saveTrackedEntityInstanceEnrollment(List teiEnrollmentsJson) async {
    for (dynamic json in teiEnrollmentsJson) {
      await EnrollmentOfflineProvider()
          .addOrUpdateEnrollment(Enrollment().fromJson(json));
    }
  }

  Future saveTrackedEntityInstanceEvents(List teiEventsJson) async {
    for (dynamic json in teiEventsJson) {
      await EventOfflineProvider().addOrUpdateEvent(Events().fromJson(json));
    }
  }

  Future saveTrackedEntityInstanceRelationShips(
    List teiRelationshipsJson,
  ) async {
    for (dynamic json in teiRelationshipsJson) {
      await TeiRelationshipOfflineProvider()
          .addOrUpdateTeiRelationship(TeiRelationship().fromJson(json));
    }
  }

  Future<List<dynamic>> discoveringBeneficiaryByFilters(
      List<String> programIds, String filters) async {
    List<dynamic> tei = [];
    try {
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      String username = currentUser!.username ?? '';
      String password = currentUser.password ?? '';
      HttpService httpService = HttpService(
        username: username,
        password: password,
      );
      var url = "api/trackedEntityInstances.json";
      for (String program in programIds) {
        var queryParameters = {
          "program": program,
          "filter": filters,
          "ouMode": "ALL",
        };
        List pageFilters =
            await SynchronizationService(username, password, programIds, [])
                .getDataPaginationFilters(
          url,
          queryParameters: queryParameters,
        );
        for (var pageFilter in pageFilters) {
          Map<String, String> dataQueryParameters = {};
          dataQueryParameters.addAll(queryParameters);
          dataQueryParameters.addAll(pageFilter);
          String queryUrl = "api/trackedEntityInstances/query.json";
          Response response = await httpService.httpGet(queryUrl,
              queryParameters: dataQueryParameters);

          if (response.statusCode == 200) {
            Map<String, dynamic> teiJson = json.decode(response.body);
            List sanitizedTeiJson = getSanitizedJson(teiJson, program);
            tei.addAll(sanitizedTeiJson);
          }
        }
      }
    } catch (error) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: 'discoveringBeneficiaryByFilters: ${error.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
    }
    return tei;
  }

  List getSanitizedJson(dynamic json, String programId) {
    List<dynamic> headers = json['headers'] ?? [];
    List<dynamic> rows = json['rows'] ?? [];

    int teiIndex =
        headers.indexWhere((dynamic item) => item['name'] == 'instance');
    int ouNameIndex =
        headers.indexWhere((dynamic item) => item['name'] == 'ouname');

    return rows.map((dynamic row) {
      return {
        "trackedEntityInstance": row[teiIndex],
        "enrollments": [
          {"orgUnitName": row[ouNameIndex], "program": programId}
        ],
        "attributes": row
            .asMap()
            .entries
            .map((rowItem) => {
                  "attribute": headers[rowItem.key]['name'] ?? '',
                  "value": rowItem.value,
                })
            .toList(),
      };
    }).toList();
  }

  Future<List<String>> discoveringBeneficiaryPrograms(String teiId) async {
    List<String> programs = [];
    try {
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      HttpService httpService = HttpService(
        username: currentUser!.username,
        password: currentUser.password,
      );
      var url = "api/trackedEntityInstances/$teiId.json";
      var queryParameters = {"fields": "enrollments[program]"};
      var response =
          await httpService.httpGet(url, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        Map<String, dynamic> dataResponse = json.decode(response.body);
        List enrollments = dataResponse["enrollments"] ?? [];
        for (var enrollment in enrollments) {
          programs.add(enrollment["program"] ?? "");
        }
      }
    } catch (error) {
      //
    }
    return programs
        .toSet()
        .toList()
        .where((program) => program.isNotEmpty)
        .toList();
  }
}
