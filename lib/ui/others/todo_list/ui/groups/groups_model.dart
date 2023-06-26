import 'package:flutter/cupertino.dart';

class GroupsModel extends ChangeNotifier{


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
