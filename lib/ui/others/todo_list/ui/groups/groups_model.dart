import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/todo_list/data/box_manager/box_manager.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_widget.dart';

class GroupsModel extends ChangeNotifier {
  GroupsModel() {
    _setup();
  }

  late final Future<Box<Group>> _groupsBox;

  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  void toForm(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRoutesNames.groupForm);
  }

  Future<void> toTasks(BuildContext context, int index) async {
    final group = (await _groupsBox).getAt(index);
    if (group != null) {
      unawaited(Navigator.pushNamed(context, MainNavigationRoutesNames.tasks,
          arguments: TasksWidgetConfiguration(
              groupKey: group.key as int, title: group.groupName)));
    }
  }

  Future<void> _setup() async {
    _groupsBox = BoxManager.instance.openGroupBox();
    await _readGroups();
    (await _groupsBox).listenable().addListener(() => _readGroups());
  }

  Future<void> _readGroups() async {
    _groups = (await _groupsBox).values.toList();
    notifyListeners();
  }

  Future<void> deleteGroup(int index) async {
    final groupKey = (await _groupsBox).keyAt(index) as int;
    final taskBoxName = BoxManager.instance.makeTaskBoxName(groupKey);
    await Hive.deleteBoxFromDisk(taskBoxName);
    await (await _groupsBox).deleteAt(index);
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
