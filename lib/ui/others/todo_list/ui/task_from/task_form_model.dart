import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/data/box_manager/box_manager.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class TaskFormModel extends ChangeNotifier {
  TaskFormModel({required this.groupKey});

  var _taskText = "";
  final int groupKey;

  bool get isValid => _taskText.trim().isNotEmpty;

  set taskText(String value) {
    final isTaskTextEmpty = _taskText.trim().isEmpty;
    _taskText = value;
    if (value.trim().isEmpty != isTaskTextEmpty) {
      notifyListeners();
    }
  }

  void saveTask(BuildContext context) async {
    final taskText = _taskText.trim();
    if (taskText.isEmpty) return;
    final tasksBox = await BoxManager.instance.openTasksBox(groupKey);
    await tasksBox.add(Task(text: taskText, isDone: false));
    await BoxManager.instance.closeBox(tasksBox);
    Navigator.pop(context);
  }
}

class TaskFormModelProvider extends InheritedNotifier {
  const TaskFormModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

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
