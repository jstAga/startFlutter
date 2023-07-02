import 'package:hive/hive.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class BoxManager {
  BoxManager._();

  static final BoxManager instance = BoxManager._();

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }

  Future<void> closeBox<T>(Box<T> box) async {
   await box.compact();
   await box.close();
  }

  Future<Box<Group>> openGroupBox() async {
    return _openBox("groups_box", 2, GroupAdapter());
  }

  Future<Box<Task>> openTasksBox(int groupKey) async {
    return _openBox(makeTaskBoxName(groupKey), 2, TaskAdapter());
  }

  String makeTaskBoxName(int groupKey) => "tasks_box_$groupKey";
}
