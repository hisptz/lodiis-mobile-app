import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = 'lsis-ovc-dreams.org';
  final String username;
  final String password;
  String basicAuth;

  HttpService({@required this.username, @required this.password}) {
    this.basicAuth = base64Encode(utf8.encode('$username:$password'));
  }

  Uri getApiUrl(String url, {Map<String, dynamic> queryParameters}) {
    return Uri.https(baseUrl, url, queryParameters);
  }

  Future<http.Response> httpPost(
    String url,
    body, {
    Map<String, dynamic> queryParameters,
  }) async {
    Uri apiUrl = getApiUrl(url, queryParameters: queryParameters);
    return http.post(
      apiUrl,
      headers: {
        HttpHeaders.authorizationHeader: "Basic $basicAuth",
        "Content-Type": "application/json",
      },
      body: body,
    );
  }

  Future<http.Response> httpPut(
    String url,
    body, {
    Map<String, dynamic> queryParameters,
  }) async {
    Uri apiUrl = getApiUrl(url, queryParameters: queryParameters);
    return http.put(
      apiUrl,
      headers: {
        HttpHeaders.authorizationHeader: "Basic $basicAuth",
        "Content-Type": "application/json",
      },
      body: body,
    );
  }

  Future<http.Response> httpDelete(
    String url, {
    Map<String, dynamic> queryParameters,
  }) async {
    Uri apiUrl = getApiUrl(url, queryParameters: queryParameters);
    return await http.delete(apiUrl, headers: {
      HttpHeaders.authorizationHeader: "Basic $basicAuth",
    });
  }

  Future<http.Response> httpGet(
    String url, {
    Map<String, dynamic> queryParameters,
  }) async {
    Uri apiUrl = getApiUrl(url, queryParameters: queryParameters);
    return await http.get(apiUrl, headers: {
      HttpHeaders.authorizationHeader: "Basic $basicAuth",
    });
  }

  Future<http.Response> httpGetPagination(
    String url,
    Map<String, dynamic> queryParameters,
  ) async {
    var dataQueryParameters = {
      "totalPages": "true",
      "pageSize": "1",
      "fields": "none",
    };
    dataQueryParameters.addAll(queryParameters);
    return await this.httpGet(url, queryParameters: dataQueryParameters);
  }

  @override
  String toString() {
    return '$baseUrl => $username : $password';
  }
}
