import 'package:hive/hive.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class BoxManager {
  BoxManager._();

  static final BoxManager instance = BoxManager._();
  final Map<String, int> _boxCounter = <String, int>{};

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (Hive.isBoxOpen(name)) {
      final count = _boxCounter[name] ?? 1;
      _boxCounter[name] = count + 1;
      return Hive.box(name);
    }
    _boxCounter[name] = 1;
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }

  Future<void> closeBox<T>(Box<T> box) async {
    var count = _boxCounter[box.name] ?? 1;
    count -= 1;
    if (!box.isOpen) {
      _boxCounter.remove(box.name);
      return;
    }
    _boxCounter[box.name] = count;
    if (count > 0) return;

    _boxCounter.remove(box.name);
    await box.compact();
    await box.close();
  }

  Future<Box<Group>> openGroupBox() async {
    return _openBox("groups_box", 2, GroupAdapter());
  }

  Future<Box<Task>> openTasksBox(int groupKey) async {
    return _openBox(makeTaskBoxName(groupKey), 3, TaskAdapter());
  }

  String makeTaskBoxName(int groupKey) => "tasks_box_$groupKey";
}
