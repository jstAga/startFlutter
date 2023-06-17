import 'dart:convert';
import 'dart:io';

import 'package:start_flutter/ui/others/workWithHttp/data/entity/post/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final json = await _get("https://jsonplaceholder.typicode.com/posts")
        as List<dynamic>;
    final data = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return data;
  }

  Future<Post> createPost({required String title, required String body}) async {
    final data = <String, dynamic>{"title": title, "body": body, "userId": 109};
    return _create(
        url: "https://jsonplaceholder.typicode.com/posts", data: data);
  }

  Future<dynamic> _get(String url) async {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    final jsonString = await response.transform(utf8.decoder).join();
    return jsonDecode(jsonString);
  }

  Future<Post> _create(
      {required String url, required Map<String, dynamic> data}) async {
    final request = await client.postUrl(Uri.parse(url));
    request.headers.set("Content-type", "application/json; charset=UTF-8");
    request.write(jsonEncode(data));
    final response = await request.close();
    final jsonString = await response.transform(utf8.decoder).join();
    final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Post.fromJson(json);
  }
}
