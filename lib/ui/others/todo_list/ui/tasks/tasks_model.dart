import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';

class TasksModel extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Group>> _groupBox;
  Group? _group;

  Group? get group => _group;

  TasksModel({required this.groupKey}) {
    _setup();
  }

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, "/todoList/tasks/taskForm", arguments: groupKey);
  }

  void _setup() {
    _groupBox = Hive.openBox<Group>("groupsBox");
    _loadGroup();
  }

  void _loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
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
