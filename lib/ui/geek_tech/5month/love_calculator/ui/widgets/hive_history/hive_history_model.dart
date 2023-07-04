import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/local/hive/box_manager/box_manager.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/local/hive/entity/love_entity/love_entity.dart';

class HiveHistoryModel extends ChangeNotifier {
  HiveHistoryModel() {
    setup();
  }

  late final Future<Box<LoveEntity>> _loveBox;
  ValueListenable<Object>? _listenableBox;
  var _loveHistory = <LoveEntity>[];

  List<LoveEntity> get loveHistory => _loveHistory.toList();

  Future<void> setup() async {
    _loveBox = BoxManager.instance.openLoveBox();
    await _readHistory();
    _listenableBox = (await _loveBox).listenable();
    _listenableBox?.addListener(() => _readHistory());
  }

  Future<void> _readHistory() async {
    _loveHistory = (await _loveBox).values.toList();
    notifyListeners();
  }

  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(() => _readHistory());
    await BoxManager.instance.closeBox(await _loveBox);
    super.dispose();
  }
}

class HiveHistoryProvider extends InheritedNotifier {
  final HiveHistoryModel model;

  const HiveHistoryProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(notifier: model, child: child);

  static HiveHistoryProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HiveHistoryProvider>();
  }

  static HiveHistoryProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HiveHistoryProvider>()
        ?.widget;
    return widget is HiveHistoryProvider ? widget : null;
  }

// @override
// bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//   return true;
// }
}
