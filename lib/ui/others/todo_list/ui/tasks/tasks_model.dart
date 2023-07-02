import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/todo_list/data/box_manager/box_manager.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_widget.dart';

class TasksModel extends ChangeNotifier {
  TasksModel({required this.configuration}) {
    _setup();
  }

  final TasksWidgetConfiguration configuration;
  late final Future<Box<Task>> _taskBox;
  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRoutesNames.taskForm,
        arguments: configuration.groupKey);
  }

  Future<void> _setup() async {
    _taskBox = BoxManager.instance.openTasksBox(configuration.groupKey);
    await _readTasks();
    (await _taskBox).listenable().addListener(() => _readTasks());
  }

  Future<void> _readTasks() async {
    _tasks = (await _taskBox).values.toList();
    notifyListeners();
  }

  Future<void> deleteTask(int taskIndex) async {
    await (await _taskBox).delete(taskIndex);
  }

  Future<void> doneTask(int taskIndex) async {
    final task = (await _taskBox).getAt(taskIndex);
    task?.isDone = !task.isDone;
    task?.save();
  }
}

class TasksModelProvider extends InheritedNotifier {
  final TasksModel model;

  const TasksModelProvider(
      {super.key, required Widget child, required this.model})
      : super(child: child, notifier: model);

  static TasksModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TasksModelProvider>();
  }

  static TasksModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksModelProvider>()
        ?.widget;
    return widget is TasksModelProvider ? widget : null;
  }
}
