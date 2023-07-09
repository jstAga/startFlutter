import 'package:flutter/widgets.dart';

class BaseNotifierProvider<Model extends ChangeNotifier>
    extends StatefulWidget {
  const BaseNotifierProvider(
      {super.key,
      required this.create,
      required this.child,
      this.isManagingModel = true});

  final Model Function() create;
  final bool isManagingModel;
  final Widget child;

  @override
  _BaseNotifierProviderState<Model> createState() =>
      _BaseNotifierProviderState<Model>();

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseInheritedNotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BaseInheritedNotifierProvider<Model>>()
        ?.widget;
    return widget is BaseInheritedNotifierProvider<Model> ? widget.model : null;
  }
}

class _BaseNotifierProviderState<Model extends ChangeNotifier>
    extends State<BaseNotifierProvider<Model>> {
  late final Model _model;

  @override
  void initState() {
    super.initState();
    _model = widget.create();
  }

  @override
  void dispose() {
    if (widget.isManagingModel) {
      _model.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInheritedNotifierProvider(model: _model, child: widget.child);
  }
}

class BaseInheritedProvider<Model> extends InheritedWidget {
  const BaseInheritedProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child);

  final Model model;

  static Model? watch<Model>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseInheritedProvider<Model>>()
        ?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BaseInheritedProvider<Model>>()
        ?.widget;
    return widget is BaseInheritedProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(BaseInheritedProvider oldWidget) {
    return model != oldWidget.model;
  }
}

class BaseInheritedNotifierProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  const BaseInheritedNotifierProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

  final Model model;

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BaseInheritedNotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<BaseInheritedNotifierProvider<Model>>()
        ?.widget;
    return widget is BaseInheritedNotifierProvider<Model> ? widget.model : null;
  }
}
