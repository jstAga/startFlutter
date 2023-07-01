import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class TasksModel extends ChangeNotifier {
  TasksModel({required this.groupKey}) {
    _setup();
  }

  int groupKey;

  late final Future<Box<Group>> _groupBox;
  Group? _group;

  Group? get group => _group;

  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, "/todoList/tasks/taskForm",
        arguments: groupKey);
  }

  void _setup() {
    Hive.openBox<Task>("tasksBox");
    _groupBox = Hive.openBox<Group>("groupsBox");
    _loadGroup();
    _setupListener();
  }

  void _loadGroup() async {
    final groupBox = await _groupBox;
    _group = groupBox.get(groupKey);
    notifyListeners();
  }

  void _readTasks() async {
    _tasks = _group?.tasks ?? <Task>[];
    notifyListeners();
  }

  void _setupListener() async {
    final box = await _groupBox;
    _readTasks();
    box.listenable(keys: <dynamic>[groupKey]).addListener(_readTasks);
  }

  void deleteTask(int groupIndex) async {
    await (_group?.tasks?.deleteFromHive(groupIndex));
    _group?.save();
  }

  void doneTask(int groupIndex) async {
    final task = _group?.tasks?[groupIndex];
    final currentState = task?.isDone ?? false;
    task?.isDone = !currentState;
    await task?.save();
    notifyListeners();
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
