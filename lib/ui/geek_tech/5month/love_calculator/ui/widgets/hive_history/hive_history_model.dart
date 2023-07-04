import 'package:flutter/cupertino.dart';

class HiveHistoryModel extends ChangeNotifier {

}

class HiveHistoryProvider extends InheritedWidget {
  final HiveHistoryModel model;

  const HiveHistoryProvider(
      {super.key, required Widget child, required this.model})
      : super(child: child);

  static HiveHistoryProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HiveHistoryProvider>();
  }

  static HiveHistoryProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HiveHistoryProvider>()
        ?.widget;
    return widget is HiveHistoryProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
