import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group.dart';

class GroupFormModel {
  var groupName = "";

  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    final box = await Hive.openBox<Group>("groupsBox");
    final group = Group(groupName: groupName);
    await box.add(group);
    await box.compact();
    await box.close();
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
  bool updateShouldNotify(GroupFormModelProvider old) {
    return true;
  }
}
