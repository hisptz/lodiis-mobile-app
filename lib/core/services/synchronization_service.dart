import 'dart:convert';
import 'package:http/http.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_data_value.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_attribute_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class SynchronizationService {
  HttpService httpClient;
  final List programs;
  final List orgUnitIds;
  final String offlineSyncStatus = 'not-synced';
  final String onlineSyncStatus = 'synced';

  SynchronizationService(
    String username,
    String password,
    this.programs,
    this.orgUnitIds,
  ) {
    httpClient = HttpService(
      username: username,
      password: password,
    );
  }

  Future<List> getDataPaginationFilters(
    String url, {
    Map<String, dynamic> queryParameters,
  }) async {
    List paginationFilter = [];
    try {
      Response response = await httpClient.httpGetPagination(
        url,
        queryParameters,
      );
      Map<String, dynamic> pager = json.decode(response.body)['pager'];
      int pagetTotal = pager['total'];
      int pageSize = 1000;
      int total = pagetTotal >= pageSize ? pagetTotal : pageSize;
      for (int page = 1; page <= (total / pageSize).round(); page++) {
        paginationFilter.add({
          "totalPages": "true",
          "page": "$page",
          "pageSize": "$pageSize",
        });
      }
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType,
          message: '(getDataPaginationFilters) ${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
    }
    return paginationFilter;
  }

  Future<void> getAndSaveEventsFromServer(
      String program, String userOrgId, String lastSyncDate) async {
    try {
      var queryParameters = {
        "program": program,
        "orgUnit": userOrgId,
        "ouMode": "DESCENDANTS",
        "lastUpdatedStartDate": lastSyncDate,
      };
      List pageFilters = await getDataPaginationFilters(
        "api/events.json",
        queryParameters: queryParameters,
      );
      for (var pageFilter in pageFilters) {
        var dataQueryParameters = {
          "fields":
              "event,program,programStage,trackedEntityInstance,status,orgUnit,dataValues[dataElement,value,displayName],eventDate",
        };
        dataQueryParameters.addAll(queryParameters);
        dataQueryParameters.addAll(pageFilter);
        String newTrackedInstanceUrl = "api/events.json";
        Response response = await httpClient.httpGet(
          newTrackedInstanceUrl,
          queryParameters: dataQueryParameters,
        );
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          List<Events> events = responseData['events']
              ?.map<Events>((event) => Events().fromJson(event))
              ?.toList();
          saveEventsToOffline(events);
        } else {
          String errorMessage = await _getHttpResponseAppLogs(response.body);
          if (errorMessage.isNotEmpty) {
            AppLogs log = AppLogs(
                type: AppLogsConstants.errorLogType, message: errorMessage);
            await AppLogsOfflineProvider().addLogs(log);
          }
        }
      }
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      throw e;
    }
  }

  Future<List<TeiRelationship>> getTeiRelationshipsfromServer(
    String program,
    String userOrgId,
  ) async {
    List<TeiRelationship> teiRelationshipsFromServer = [];
    try {
      var queryParameters = {
        "program": program,
        "orgUnit": userOrgId,
        "ouMode": "DESCENDANTS"
      };
      List pageFilters = await getDataPaginationFilters(
        "api/relationships.json",
        queryParameters: queryParameters,
      );
      for (var pageFilter in pageFilters) {
        var dataQueryParameters = {
          "fields":
              "relationships[relationshipType,relationship,from[trackedEntityInstance[trackedEntityInstance]],to[trackedEntityInstance[trackedEntityInstance]]]",
        };
        String newTeiRelationshipsUrl = "api/relationships.json";
        dataQueryParameters.addAll(queryParameters);
        dataQueryParameters.addAll(pageFilter);
        Response response = await httpClient.httpGet(
          newTeiRelationshipsUrl,
          queryParameters: dataQueryParameters,
        );
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          for (var teiRelationship in responseData["relationships"]) {
            teiRelationshipsFromServer
                .add(TeiRelationship().fromOnline(teiRelationship));
          }
        } else {
          String errorMessage = await _getHttpResponseAppLogs(response.body);
          if (errorMessage.isNotEmpty) {
            AppLogs log = AppLogs(
                type: AppLogsConstants.errorLogType, message: errorMessage);
            await AppLogsOfflineProvider().addLogs(log);
          }
          return null;
        }
      }
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      throw e;
    }
    return teiRelationshipsFromServer;
  }

  Future saveEventsToOffline(List<Events> events) async {
    try {
      await EventOfflineProvider().addOrUpdateMultipleEvents(events);
    } catch (e) {
      throw e;
    }
  }

  Future saveTeiRelationshipToOffline(TeiRelationship relationship) async {
    await TeiRelatioShipOfflineProvider()
        .addOrUpdateTeirelationShip(relationship);
  }

  Future saveRelationshipsToOffline(List<dynamic> relationships) async {
    for (var relationship in relationships) {
      await saveTeiRelationshipToOffline(
          TeiRelationship().fromOnline(relationship));
    }
  }

  Future<List> getOfflineEventsAttributesValuesById(String eventIds) async {
    List entityInstanceAttributes =
        await EventOfflineDataValueProvider().getEventDataValues(eventIds);
    return entityInstanceAttributes;
  }

  List<TrackeEntityInstance> getTeiFromResponse(responseData) {
    return responseData['trackedEntityInstances']
        ?.map<TrackeEntityInstance>(
            (instance) => TrackeEntityInstance().fromJson(instance))
        ?.toList();
  }

  Map<String, List> getEnrollmentsAndRelationshipsFromResponse(responseData) {
    List<Enrollment> enrollments = [];
    List<TeiRelationship> relationships = [];
    for (var tei in responseData['trackedEntityInstances']) {
      enrollments.addAll(tei['enrollments']
          ?.map<Enrollment>((t) => Enrollment().fromJson(t))
          ?.toList());
      relationships.addAll(tei['relationships']
          ?.map<TeiRelationship>((t) => TeiRelationship().fromOnline(t))
          ?.toList());
    }
    return {'enrollments': enrollments, 'relationships': relationships};
  }

  Future<void> saveTeis(var responseData) async {
    try {
      Map enrollmentsAndRelationships =
          getEnrollmentsAndRelationshipsFromResponse(responseData);
      TrackedEntityInstanceOfflineProvider()
          .addOrUpdateMultipleTrackedEntityInstance(
              getTeiFromResponse(responseData));
      EnrollmentOfflineProvider().addOrUpdateMultipleEnrollments(
          enrollmentsAndRelationships['enrollments']);
      TeiRelatioShipOfflineProvider().addOrUpdateMultipleTeiRelationships(
          enrollmentsAndRelationships['relationships']);
    } catch (e) {
      throw e;
    }
  }

  Future<void> getAndSaveTrackedInstanceFromServer(
      String program, String userOrgId, String lastSyncDate) async {
    var queryParameters = {
      "program": program,
      "ou": userOrgId,
      "ouMode": "DESCENDANTS",
      "lastUpdatedStartDate": lastSyncDate,
    };
    List pageFilters = await getDataPaginationFilters(
      "api/trackedEntityInstances.json",
      queryParameters: queryParameters,
    );
    for (var pageFilter in pageFilters) {
      try {
        var dataQueryParameters = {
          "fields":
              "trackedEntityInstance,trackedEntityType,orgUnit,attributes[attribute,value, displayName],enrollments[enrollment,enrollmentDate,incidentDate,orgUnit,program,trackedEntityInstance,status]relationships[relationshipType,relationship,from[trackedEntityInstance[trackedEntityInstance]],to[trackedEntityInstance[trackedEntityInstance]]]",
        };
        String newTrackedInstanceUrl = "api/trackedEntityInstances.json";
        dataQueryParameters.addAll(queryParameters);
        dataQueryParameters.addAll(pageFilter);
        Response response = await httpClient.httpGet(
          newTrackedInstanceUrl,
          queryParameters: dataQueryParameters,
        );
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);
          await saveTeis(responseData);
        } else {
          String errorMessage = await _getHttpResponseAppLogs(response.body);
          if (errorMessage.isNotEmpty) {
            AppLogs log = AppLogs(
                type: AppLogsConstants.errorLogType, message: errorMessage);
            await AppLogsOfflineProvider().addLogs(log);
          }
          return null;
        }
      } catch (e) {
        AppLogs log = AppLogs(
            type: AppLogsConstants.errorLogType, message: '${e.toString()}');
        await AppLogsOfflineProvider().addLogs(log);
        throw e;
      }
    }
  }

  Future saveEnrollmentToOffline(dynamic enrollments) async {
    for (var enrollment in enrollments) {
      EnrollmentOfflineProvider()
          .addOrUpdateEnrollement(Enrollment().fromJson(enrollment));
    }
  }

  Future<List> getOfflineTrackedEntityAttributesValuesById(
      List<String> attributeIds) async {
    List entityInstanceAttributes =
        await TrackedEntityInstanceOfflineAttributeProvider()
            .getTrackedEntityAttributesValuesById(attributeIds);
    return entityInstanceAttributes;
  }

  Future<List<TrackeEntityInstance>> getTeisFromOfflineDb() async {
    return await TrackedEntityInstanceOfflineProvider()
        .getTrackedEntityInstanceByStatus(offlineSyncStatus);
  }

  Future<List<Enrollment>> getTeiEnrollmentFromOfflineDb() async {
    return await EnrollmentOfflineProvider()
        .getEnrollmentByStatus(offlineSyncStatus);
  }

  Future<List<TeiRelationship>> getTeiRelationShipFromOfflineDb() async {
    return await TeiRelatioShipOfflineProvider().getAllTeiRelationShips();
  }

  Future<int> getOfflineEventsCount(CurrentUser currentUser) async {
    int eventsCount = 0;
    for (String orgUnit in currentUser.userOrgUnitIds) {
      for (String program in currentUser.programs) {
        int count =
            await EventOfflineProvider().getOfflineEventCount(program, orgUnit);
        eventsCount += count;
      }
    }
    return eventsCount;
  }

  Future<int> getOfflineEnrollmentCount(CurrentUser currentUser) async {
    int enrollmentsCount = 0;
    for (String orgUnit in currentUser.userOrgUnitIds) {
      for (String program in currentUser.programs) {
        int count = await EnrollmentOfflineProvider()
            .getOfflineEnrollmentsCount(program, orgUnit);
        enrollmentsCount += count;
      }
    }
    return enrollmentsCount;
  }

  Future<int> getTotalFromPaginator(String url,
      {Map<String, dynamic> queryParameters}) async {
    Response response = await httpClient.httpGetPagination(
      url,
      queryParameters,
    );
    Map<String, dynamic> pager = json.decode(response.body)['pager'];
    int pagetTotal = pager['total'] ?? 0;
    return pagetTotal;
  }

  Future<int> getOnlineEnrollmentsCount(CurrentUser currentUser) async {
    int enrollmentsCount = 0;
    String url = 'api/trackedEntityInstances';
    for (String orgUnit in currentUser.userOrgUnitIds) {
      for (String program in currentUser.programs) {
        var queryParameters = {
          "program": program,
          "ou": orgUnit,
          "ouMode": "DESCENDANTS",
          "fields": "none",
          "pageSize": "1",
          "totalPages": "true",
        };
        int count =
            await getTotalFromPaginator(url, queryParameters: queryParameters);
        enrollmentsCount += count;
      }
    }
    return enrollmentsCount;
  }

  Future<int> getOnlineEventsCount(CurrentUser currentUser) async {
    int eventsCount = 0;
    String url = 'api/events';
    for (String orgUnit in currentUser.userOrgUnitIds) {
      for (String program in currentUser.programs) {
        var queryParameters = {
          "program": program,
          "orgUnit": orgUnit,
          "ouMode": "DESCENDANTS",
          "fields": "none",
          "pageSize": "1",
          "totalPages": "true",
        };
        int count =
            await getTotalFromPaginator(url, queryParameters: queryParameters);
        eventsCount += count;
      }
    }
    return eventsCount;
  }

  Future<List<Events>> getTeiEventsFromOfflineDb() async {
    return await EventOfflineProvider()
        .getTrackedEntityInstanceEventsByStatus(offlineSyncStatus);
  }

  Future uploadTeisToTheServer(List<TrackeEntityInstance> teis,
      List<Enrollment> teiEnrollments, bool isAutoUpload) async {
    List<String> syncedIds = [];
    String url = 'api/trackedEntityInstances';
    Map body = Map();
    var enrollments = teiEnrollments
        .map((enrollment) => enrollment.toOffline(enrollment))
        .toList();
    body['trackedEntityInstances'] = teis.map((tei) {
      var data = tei.toOffline(tei);
      String trackedEntityInstance = data['trackedEntityInstance'];
      data['attributes'] =
          data['attributes'].where((att) => att['value'] != 'null').toList();
      data['enrollments'] = enrollments
          .where((enrollment) =>
              enrollment['trackedEntityInstance'] == trackedEntityInstance)
          .toList();
      return data;
    }).toList();

    try {
      var queryParameters = {
        "strategy": "CREATE_AND_UPDATE",
      };
      var response = await httpClient.httpPost(
        url,
        json.encode(body),
        queryParameters: queryParameters,
      );
      if (response.statusCode >= 400 && response.statusCode != 409) {
        var message = await _getHttpResponseAppLogs(response.body);
        if (message.isNotEmpty) {
          AppLogs log =
              AppLogs(type: AppLogsConstants.errorLogType, message: message);
          await AppLogsOfflineProvider().addLogs(log);
        }
        if (!isAutoUpload) {
          AppUtil.showToastMessage(message: 'Error uploading data');
        }
      }
      var referenceIds = await _getReferenceIds(json.decode(response.body));
      syncedIds = referenceIds['syncedIds'];
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }

      throw e;
    }
    if (syncedIds.length > 0) {
      for (TrackeEntityInstance tei in teis) {
        if (syncedIds.indexOf(tei.trackedEntityInstance) > -1) {
          tei.syncStatus = 'synced';
          FormUtil.savingTrackeEntityInstance(tei);
        }
      }
      for (Enrollment teiEnrollment in teiEnrollments) {
        if (syncedIds.indexOf(teiEnrollment.trackedEntityInstance) > -1) {
          teiEnrollment.syncStatus = 'synced';
          FormUtil.savingEnrollment(teiEnrollment);
        }
      }
    }
  }

  Future uploadTeiEventsToTheServer(List<Events> teiEvents, bool isAutoUpload,
      {bool checkEnrollments = true}) async {
    List<String> syncedIds = [];
    List<String> unsyncedDueToEnrollment = [];
    String url = 'api/events';
    Map body = Map();
    body['events'] = teiEvents.map((event) {
      var data = event.toOffline(event);
      if (data['trackedEntityInstance'] == null ||
          data['trackedEntityInstance'] == '') {
        data.remove('trackedEntityInstance');
      }
      return data;
    }).toList();

    try {
      var queryParameters = {
        "strategy": "CREATE_AND_UPDATE",
      };
      var response = await httpClient.httpPost(
        url,
        json.encode(body),
        queryParameters: queryParameters,
      );
      if (response.statusCode >= 400 && response.statusCode != 409) {
        var message = await _getHttpResponseAppLogs(response.body);
        if (message.isNotEmpty) {
          AppLogs log =
              AppLogs(type: AppLogsConstants.errorLogType, message: message);
          await AppLogsOfflineProvider().addLogs(log);
        }
        if (!isAutoUpload) {
          AppUtil.showToastMessage(message: 'Error uploading data');
        }
      }
      var referenceIds = await _getReferenceIds(json.decode(response.body));
      syncedIds = referenceIds['syncedIds'];
      unsyncedDueToEnrollment = referenceIds['unsyncedDueToEnrollment'];
      if (unsyncedDueToEnrollment.isNotEmpty && checkEnrollments) {
        List<Enrollment> unsyncedEnrollment =
            await checkForUnenrolledBeneficiaries(unsyncedDueToEnrollment);
        if (unsyncedEnrollment.isNotEmpty) {
          await uploadUnsyncedEnrollments(unsyncedEnrollment);
          await uploadTeiEventsToTheServer(teiEvents, isAutoUpload,
              checkEnrollments: false);
        }
      }
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
      throw e;
    }
    if (syncedIds.length > 0) {
      for (Events event in teiEvents) {
        if (syncedIds.indexOf(event.event) > -1) {
          event.syncStatus = 'synced';
          FormUtil.savingEvent(event);
        }
      }
    }
  }

  Future uploadTeiRelationToTheServer(
      List<TeiRelationship> teiRelationShips, bool isAutoUpload) async {
    Map body = Map<String, dynamic>();
    String url = 'api/relationships';
    body['relationships'] = teiRelationShips
        .map((relationship) => relationship.toOnline())
        .toList();
    try {
      var queryParameters = {
        "strategy": "CREATE_AND_UPDATE",
      };
      var response = await httpClient.httpPost(
        url,
        json.encode(body),
        queryParameters: queryParameters,
      );
      if (response.statusCode >= 400 && response.statusCode != 409) {
        var message = await _getHttpResponseAppLogs(response.body);
        if (message.isNotEmpty) {
          AppLogs log =
              AppLogs(type: AppLogsConstants.errorLogType, message: message);
          await AppLogsOfflineProvider().addLogs(log);
        }
        if (!isAutoUpload) {
          AppUtil.showToastMessage(message: 'Error uploading data');
        }
      }
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      if (!isAutoUpload) {
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
      throw e;
    }
  }

  String getNginxErrorMessage(String responseBody) {
    String errorMessage = '';
    try {
      int errorMessageStart = responseBody.lastIndexOf('<h1>');
      int errorMessageEnd = responseBody.lastIndexOf('</h1>');
      if (errorMessageStart != -1 && errorMessageEnd != -1) {
        errorMessage = responseBody
            .substring(errorMessageStart, errorMessageEnd)
            .replaceAll(new RegExp('<h1>'), '')
            .trim();
      }
    } catch (e) {
      throw e;
    }
    return errorMessage;
  }

  String getDhis2TomcatErrorMessage(String responseBody) {
    String errorMessage = '';
    try {
      String status = '';
      String description = '';
      int descriptionStart = responseBody.lastIndexOf('<b>Description</b> ');
      int descriptionEnd = responseBody.lastIndexOf('</p>');
      int httpStatusStart = responseBody.lastIndexOf('<h1>HTTP');
      int httpStatusEnd = responseBody.lastIndexOf('</h1>');
      if (descriptionStart != -1 &&
          descriptionEnd != -1 &&
          httpStatusStart != -1 &&
          httpStatusEnd != -1) {
        description = responseBody
            .substring(descriptionStart, descriptionEnd)
            .replaceAll(new RegExp('<b>Description</b>'), '')
            .trim();
        status = responseBody
            .substring(httpStatusStart, httpStatusEnd)
            .replaceAll(new RegExp('<h1>'), '')
            .trim();
        errorMessage = '$status : $description';
      }
    } catch (e) {
      throw e;
    }
    return errorMessage;
  }

  Future<String> _getHttpResponseAppLogs(String responseBody) async {
    String logMessage = '';
    try {
      if (responseBody.toLowerCase().contains('nginx')) {
        logMessage = getNginxErrorMessage(responseBody);
      } else {
        logMessage = getDhis2TomcatErrorMessage(responseBody);
      }
    } catch (error) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${error.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
    }
    return logMessage;
  }

  Future<Map<String, List<String>>> _getReferenceIds(Map body) async {
    List<String> syncedIds = [];
    List<String> unsyncedDueToEnrollment = [];
    try {
      var bodyResponse = body['response'];
      var importSummaries = bodyResponse['importSummaries'] ?? [];
      for (var importSummary in importSummaries) {
        if (importSummary['status'] == 'SUCCESS' &&
            importSummary['reference'] != null) {
          syncedIds.add(importSummary['reference']);
        } else {
          if (importSummary['conflicts'] != null) {
            for (var conflict in importSummary['conflicts']) {
              AppLogs log = AppLogs(
                  type: AppLogsConstants.errorLogType,
                  message: "${conflict['object']}: ${conflict['value']}");
              await AppLogsOfflineProvider().addLogs(log);
              AppUtil.showToastMessage(message: 'Error uploading data');
            }
          } else if (importSummary['description'] != null) {
            if (importSummary['description'].contains('is not enrolled')) {
              unsyncedDueToEnrollment.add(importSummary['reference']);
            }
            AppLogs log = AppLogs(
                type: AppLogsConstants.errorLogType,
                message: importSummary['description']);
            await AppLogsOfflineProvider().addLogs(log);
            AppUtil.showToastMessage(message: 'Error uploading data');
          }
        }
      }
    } catch (error) {}
    Map<String, List<String>> referenceIds = Map();
    referenceIds['syncedIds'] = syncedIds;
    referenceIds['unsyncedDueToEnrollment'] = unsyncedDueToEnrollment;
    return referenceIds;
  }

  Future uploadUnsyncedEnrollments(List<Enrollment> teiEnrollments) async {
    List<String> syncedIds = [];
    String url = 'api/enrollments';
    Map body = Map();
    body['enrollments'] = teiEnrollments
        .map((enrollment) => enrollment.toOffline(enrollment))
        .toList();
    try {
      var queryParameters = {
        "strategy": "CREATE_AND_UPDATE",
      };
      var response = await httpClient.httpPost(
        url,
        json.encode(body),
        queryParameters: queryParameters,
      );
      if (response.statusCode >= 400 && response.statusCode != 409) {
        var message = await _getHttpResponseAppLogs(response.body);
        if (message.isNotEmpty) {
          AppLogs log =
              AppLogs(type: AppLogsConstants.errorLogType, message: message);
          await AppLogsOfflineProvider().addLogs(log);
        }
        AppUtil.showToastMessage(message: 'Error uploading data');
      }
      var referenceIds = await _getReferenceIds(json.decode(response.body));
      syncedIds = referenceIds['syncedIds'];
    } catch (e) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: '${e.toString()}');
      await AppLogsOfflineProvider().addLogs(log);
      AppUtil.showToastMessage(message: 'Error uploading data');
      throw e;
    }
    if (syncedIds.length > 0) {
      for (Enrollment teiEnrollment in teiEnrollments) {
        if (syncedIds.indexOf(teiEnrollment.trackedEntityInstance) > -1) {
          teiEnrollment.syncStatus = 'synced';
          FormUtil.savingEnrollment(teiEnrollment);
        }
      }
    }
  }

  Future<List<Enrollment>> checkForUnenrolledBeneficiaries(
      List<String> eventIds) async {
    List<Events> eventsWithoutEnrollment = await EventOfflineProvider()
        .getTrackedEntityInstanceEventsByStatus('', eventList: eventIds);
    List<String> teiNotEnrolled = eventsWithoutEnrollment
        .map((Events event) => event.trackedEntityInstance)
        .toList();
    List<Enrollment> unsyncedEnrollments = await EnrollmentOfflineProvider()
        .getEnrollmentsFromTeiList(teiNotEnrolled);
    return unsyncedEnrollments;
  }
}
