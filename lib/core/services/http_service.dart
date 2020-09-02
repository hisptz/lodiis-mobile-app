import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = 'http://play.dhis2.org/demo';
  final String username;
  final String password;
  String basicAuth;

  HttpService({@required this.username, @required this.password}) {
    this.basicAuth = base64Encode(utf8.encode('$username:$password'));
  }

  Future<http.Response> httpPost(String url, body) async {
    return http.post(url,
        headers: {HttpHeaders.authorizationHeader: "Basic $basicAuth"},
        body: body);
  }

  Future<http.Response> httpPut(String url, body) async {
    return http.put(url,
        headers: {HttpHeaders.authorizationHeader: "Basic $basicAuth"},
        body: body);
  }

  Future<http.Response> httpDelete(
    String url,
  ) async {
    url = '$baseUrl/$url';
    return await http.delete(url,
        headers: {HttpHeaders.authorizationHeader: "Basic $basicAuth"});
  }

  Future<http.Response> httpGet(
    String url,
  ) async {
    url = '$baseUrl/$url';
    return await http.get(url,
        headers: {HttpHeaders.authorizationHeader: "Basic $basicAuth"});
  }
}
