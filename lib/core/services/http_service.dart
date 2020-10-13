import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = 'https://lsis-ovc-dreams.org';
  final String username;
  final String password;

  String basicAuth;

  HttpService({@required this.username, @required this.password}) {
    this.basicAuth = base64Encode(utf8.encode('$username:$password'));
  }

  Future<http.Response> httpPost(String url, body) async {
    url = '$baseUrl/$url';
    return http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "Basic $basicAuth",
          "Content-Type": "application/json"
        },
        body: body);
  }

  Future<http.Response> httpPut(String url, body) async {
    url = '$baseUrl/$url';
    return http.put(url,
        headers: {
          HttpHeaders.authorizationHeader: "Basic $basicAuth",
          "Content-Type": "application/json"
        },
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

  Future<http.Response> httpGetPagination(String url, int pageSize) async {
    url = '$url&totalPages=true&pageSize=1&fields=none';
    var response = await this.httpGet(url);
      return response;
  }

  @override
  String toString() {return '$baseUrl => $username : $password';}
}
