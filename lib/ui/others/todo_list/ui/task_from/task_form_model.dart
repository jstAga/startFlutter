import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class TaskFormModel {
  TaskFormModel({required this.groupKey});

  var taskText = "";
  final int groupKey;

  void saveTask(BuildContext context) async {
    if (taskText.isEmpty) return;

    final groupBox = await Hive.openBox<Group>("groupBox");
    final group = groupBox.get(groupKey);

    final tasksBox = await Hive.openBox<Task>("tasksBox");
    final task = Task(text: taskText, isDone: false);
    await tasksBox.add(task);

    group?.addTask(tasksBox, task);

    await tasksBox.compact();
    Navigator.pop(context);
  }
}

class TaskFormModelProvider extends InheritedWidget {
  const TaskFormModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child);

  final TaskFormModel model;

  static TaskFormModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskFormModelProvider>();
  }

  static TaskFormModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormModelProvider>()
        ?.widget;
    return widget is TaskFormModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskFormModelProvider oldWidget) {
    return false;
  }
}
