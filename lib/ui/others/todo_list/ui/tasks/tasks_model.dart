import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class TasksModel extends ChangeNotifier {
  TasksModel({required this.groupKey}) {
    _setup();
  }

  int groupKey;
  Group? _group;

  Group? get group => _group;
  late final Future<Box<Group>> _groupBox;

  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, "/todoList/tasks/taskForm",
        arguments: groupKey);
  }

  void _setup() {
    _groupBox = Hive.openBox<Group>("groupsBox");
    _loadTask();
    _setupListener();
  }

  void _loadTask() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
    notifyListeners();
  }

  void _readTasks() {
    _tasks = _group?.tasks ?? <Task>[];
    notifyListeners();
  }

  void _setupListener() async {
    final box = await _groupBox;
    _readTasks();
    box.listenable(keys: <dynamic>[groupKey]).addListener(_readTasks);
  }

  void deleteTask(int groupIndex) {
    _group?.tasks?.deleteFromHive(groupIndex);
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
