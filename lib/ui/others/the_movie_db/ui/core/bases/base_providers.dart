import 'package:flutter/widgets.dart';

class BaseNotifierProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  const BaseNotifierProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

  final Model model;

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseNotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BaseNotifierProvider<Model>>()
        ?.widget;
    return widget is BaseNotifierProvider<Model> ? widget.model : null;
  }
}

class BaseProvider<Model> extends InheritedWidget {
  const BaseProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child);

  final Model model;

  static Model? watch<Model>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseProvider<Model>>()
        ?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BaseProvider<Model>>()
        ?.widget;
    return widget is BaseProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(BaseProvider oldWidget) {
    return model != oldWidget.model;
  }
}
