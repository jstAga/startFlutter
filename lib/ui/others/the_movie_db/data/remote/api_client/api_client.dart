import 'dart:io';

import 'package:start_flutter/ui/others/the_movie_db/data/core/network/base_api_client.dart';

class ApiClient {
  static const _host = "https://api.themoviedb.org/3";
  static const _apiKey = "db4f25ed06d95e5c2ca4d4695470a0dd";
  final _baseApiClient =
      BaseApiClient(host: _host, client: HttpClient(), apiKey: _apiKey);

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await _getToken();
    final validateToken = await _postValidateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _postSession(validateToken);
    return sessionId;
  }

  Future<String> _getToken() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap["request_token"] as String;
      return token;
    }

    final result = _baseApiClient.get("/authentication/token/new?", parser,
        <String, dynamic>{"api_key": _apiKey});

    return result;
  }

  Future<String> _postValidateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap["request_token"] as String;
      return token;
    }

    final bodyParameters = <String, dynamic>{
      "username": username,
      "password": password,
      "request_token": requestToken
    };

    final result = _baseApiClient.post(
        "/authentication/token/validate_with_login?",
        parser,
        bodyParameters,
        <String, dynamic>{"api_key": _apiKey});
    return result;
  }

  Future<String> _postSession(String requestToken) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap["session_id"] as String;
      return sessionId;
    }

    final bodyParameters = <String, dynamic>{"request_token": requestToken};

    final result = _baseApiClient.post("/authentication/session/new?", parser,
        bodyParameters, <String, dynamic>{"api_key": _apiKey});
    return result;
  }
}
