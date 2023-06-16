import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/workWithJson/data/data.dart';

class WorkWithJson extends StatelessWidget {
  const WorkWithJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: JsonProvider(coder: JsonCoder(), child: const JsonButtons())),
    );
  }
}

class JsonButtons extends StatelessWidget {
  const JsonButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(
          onPressed: () => JsonProvider.read(context)?.coder.encode(),
          child: const Text("Кодировать"),
        ),
        ElevatedButton(
          onPressed: () => JsonProvider.read(context)?.coder.decode(),
          child: const Text("Декодировать"),
        ),
      ],
    ));
  }
}

class JsonProvider extends InheritedWidget {
  final JsonCoder coder;

  const JsonProvider({Key? key, required this.coder, required Widget child})
      : super(key: key, child: child);

  static JsonProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonProvider>();
  }

  static JsonProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<JsonProvider>()?.widget;
    return widget is JsonProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonProvider oldWidget) {
    return true;
  }
}

class JsonCoder {
  void encode() {
    final objects = humans.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(objects);
    print(jsonString);
  }

  void decode() {
    try {
      // final json = jsonDecode(jsonString) as List<dynamic>;
      // final human = json
      //     .map((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
      //     .toList();
      print("success");
    } catch (error) {
      print("error ->$error");
    }
  }
}
