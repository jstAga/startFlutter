import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/local/hive/box_manager/box_manager.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';

class LoveResultModel {
  final LoveResponse response;

  LoveResultModel({required this.response}) {
    _save();
  }

  Future<void> _save() async {
    final loveBox = await BoxManager.instance.openLoveBox();
    await loveBox.add(response.toLoveEntity());
    await BoxManager.instance.closeBox(loveBox);
  }
}

class LoveResultProvider extends InheritedWidget {
  final LoveResultModel model;

  const LoveResultProvider(
      {super.key, required Widget child, required this.model})
      : super(child: child);

  static LoveResultProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoveResultProvider>();
  }

  static LoveResultProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoveResultProvider>()
        ?.widget;
    return widget is LoveResultProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
