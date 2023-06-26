import 'dart:convert';
import 'dart:io';

import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';

class ApiClient {
  final client = HttpClient();

  Future<LoveResponse> getLove(
      {required String firstName, required String secondName}) async {
    final json = await _get(
        "https://love-calculator.p.rapidapi.com/getPercentage?sname=$secondName&fname=$firstName");
    final result = LoveResponse.fromJson(json as Map<String, dynamic>);
    return result;
  }

  Future<dynamic> _get(String url) async {
    final request = await client.getUrl(Uri.parse(url));
    request.headers.add(
        "X-RapidAPI-Key", "522d966999msha190ba44d1b26c6p169d5cjsn8794069ff072");
    request.headers.add("X-RapidAPI-Host", "love-calculator.p.rapidapi.com");
    final response = await request.close();
    final jsonString = await response.transform(utf8.decoder).join();
    return jsonDecode(jsonString);
  }
}
