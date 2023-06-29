import 'package:flutter/material.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidget();
}

class _TaskFormWidget extends State<TaskFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New task")),
      body: SafeArea(child: Center()),
    );
  }
}
