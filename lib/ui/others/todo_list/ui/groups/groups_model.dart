import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

class GroupsModel extends ChangeNotifier {
  GroupsModel() {
    _setup();
  }

  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRoutesNames.groupForm);
  }

  Future<void> toTasks(BuildContext context, int index) async {
    final box = await Hive.openBox<Group>("groupsBox");
    final groupKey = box.keyAt(index) as int;
    unawaited(
        Navigator.pushNamed(context, MainNavigationRoutesNames.tasks, arguments: groupKey));
  }

  void _setup() async {
    final box = await Hive.openBox<Group>("groupsBox");
    await Hive.openBox<Task>("tasksBox");
    _readGroups(box);
    box.listenable().addListener(() => _readGroups(box));
  }

  void _readGroups(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  void deleteGroup(int index) async {
    final box = await Hive.openBox<Group>("groupsBox");
    await box.getAt(index)?.tasks?.deleteAllFromHive();
    await box.deleteAt(index);
  }
}

class GroupsModelProvider extends InheritedNotifier {
  final GroupsModel model;

  const GroupsModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child, notifier: model);

  static GroupsModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupsModelProvider>();
  }

  static GroupsModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupsModelProvider>()
        ?.widget;
    return widget is GroupsModelProvider ? widget : null;
  }
}
