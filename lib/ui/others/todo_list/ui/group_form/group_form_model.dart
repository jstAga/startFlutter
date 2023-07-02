import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/data/box_manager/box_manager.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';

class GroupFormModel {
  var groupName = "";

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    final tasksBox = await BoxManager.instance.openGroupBox();
    await tasksBox.add(Group(groupName: groupName));
    Navigator.pop(context);
  }
}

class GroupFormModelProvider extends InheritedWidget {
  const GroupFormModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child);

  final GroupFormModel model;

  static GroupFormModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupFormModelProvider>();
  }

  static GroupFormModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupFormModelProvider>()
        ?.widget;
    return widget is GroupFormModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupFormModelProvider oldWidget) {
    return false;
  }
}
