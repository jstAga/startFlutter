import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/todo_list/data/box_manager/box_manager.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';

class GroupFormModel extends ChangeNotifier {
  var _groupName = "";
  String? errorText;

  set groupName(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _groupName = value;
  }

  void saveGroup(BuildContext context) async {
    final groupName = _groupName.trim();
    if (groupName.isEmpty) {
      errorText = "Enter group name";
      notifyListeners();
      return;
    }
    final groupsBox = await BoxManager.instance.openGroupBox();
    await groupsBox.add(Group(groupName: groupName));
    await BoxManager.instance.closeBox(groupsBox);
    await BoxManager.instance.closeBox(groupsBox);
    Navigator.pop(context);
  }
}

class GroupFormModelProvider extends InheritedNotifier {
  const GroupFormModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

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
