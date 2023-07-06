import 'dart:io';

import 'package:start_flutter/ui/others/the_movie_db/data/core/network/base_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

class AuthApiClient {
  final _baseApiClient = BaseApiClient(
      host: MovieDbConstants.baseUrl,
      client: HttpClient(),
      apiKey: MovieDbConstants.apiKey);

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

    final result = _baseApiClient.get(MovieDbConstants.getToken, parser,
        <String, dynamic>{"api_key": MovieDbConstants.apiKey});

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
        MovieDbConstants.postValidateUser,
        parser,
        bodyParameters,
        <String, dynamic>{"api_key": MovieDbConstants.apiKey});
    return result;
  }

  Future<String> _postSession(String requestToken) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap["session_id"] as String;
      return sessionId;
    }

    final bodyParameters = <String, dynamic>{"request_token": requestToken};

    final result = _baseApiClient.post(MovieDbConstants.postSession, parser,
        bodyParameters, <String, dynamic>{"api_key": MovieDbConstants.apiKey});
    return result;
  }
}