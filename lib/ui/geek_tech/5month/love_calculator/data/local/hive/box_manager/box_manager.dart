import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/local/hive/entity/love_entity/love_entity.dart';

class BoxManager {
  BoxManager._();

  static final BoxManager instance = BoxManager._();
  final Map<String, int> _boxCounter = <String, int>{};

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (Hive.isBoxOpen(name)) {
      final count = _boxCounter[name] ?? 1;
      _boxCounter[name] = count + 1;
      return Hive.box(name);
    }
    _boxCounter[name] = 1;
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }

  Future<void> closeBox<T>(Box<T> box) async {
    var count = _boxCounter[box.name] ?? 1;
    count -= 1;
    if (!box.isOpen) {
      _boxCounter.remove(box.name);
      return;
    }
    _boxCounter[box.name] = count;
    if (count > 0) return;

    _boxCounter.remove(box.name);
    await box.compact();
    await box.close();
  }

  Future<Box<LoveEntity>> openLoveBox() async {
    return _openBox("love_box", 4, LoveEntityAdapter());
  }
}
