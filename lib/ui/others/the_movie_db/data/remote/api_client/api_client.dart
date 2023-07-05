import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  static const _host = "https://api.themoviedb.org/3";
  static const _imageUrl = "https://image.tmdb.org/t/p/w500";
  static const _apiKey = "db4f25ed06d95e5c2ca4d4695470a0dd";

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse("$_host$path");
    return parameters == null ? uri : uri.replace(queryParameters: parameters);
  }

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await _makeToken();
    final validateToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(validateToken);
    return sessionId;
  }

  Future<String> _makeToken() async {
    final url = _makeUri(
        "/authentication/token/new?", <String, dynamic>{"api_key": _apiKey});
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json["request_token"] as String;
    return token;
  }

  // "request_token": "ff52cab2f773c3ce2034d0501183392f2760f24a"

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final url = _makeUri("/authentication/token/validate_with_login?",
        <String, dynamic>{"api_key": _apiKey});
    final parameters = <String, dynamic>{
      "username": username,
      "password": password,
      "request_token": requestToken
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json["request_token"] as String;
    return token;
  }

  Future<String> _makeSession(String requestToken) async {
    final url = _makeUri(
        "/authentication/session/new?", <String, dynamic>{"api_key": _apiKey});
    final parameters = <String, dynamic>{"request_token": requestToken};

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();

    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final sessionId = json["session_id"] as String;
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
