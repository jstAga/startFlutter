import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';

class GroupsModel extends ChangeNotifier {
  GroupsModel() {
    _setup();
  }

  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, "/todoList/groupForm");
  }

  Future<void> toTasks(BuildContext context, int index) async {
    final box = await Hive.openBox<Group>("groupsBox");
    final groupKey = box.keyAt(index) as int;
    unawaited(
        Navigator.pushNamed(context, "/todoList/tasks", arguments: groupKey));
  }

  void deleteGroup(int index) async {
    final box = await Hive.openBox<Group>("groupsBox");
    await box.deleteAt(index);
  }

  void _readGroups(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    final box = await Hive.openBox<Group>("groupsBox");
    _readGroups(box);
    box.listenable().addListener(() => _readGroups(box));
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
