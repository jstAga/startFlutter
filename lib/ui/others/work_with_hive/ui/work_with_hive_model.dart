import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/pet/pet.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/user/user.dart';

class WorkWithHiveModel {
  Future<void> create() async {
    var petBox = await Hive.openBox<Pet>("petBox");
    var userBox = await Hive.openBox<User>("test");

    final pet = Pet("Fire");
    await petBox.add(pet);
    final pets = HiveList(petBox, objects: [pet]);

    final user = User("Ivanov", 34, pets);
    await userBox.add(user);

    await petBox.compact();
    await userBox.compact();
    await petBox.close();
    await userBox.close();
  }

  Future<void> read() async {
    var petBox = await Hive.openBox<Pet>("petBox");
    var box = await Hive.openBox<User>("test");
    print(box.values);
    petBox.close();
    await box.close();
  }

  Future<void> delete() async {
    var box = await Hive.openBox<User>("test");
    await box.deleteAt(0);
    await box.close();
  }

  Future<void> clearAll() async {
    var petBox = await Hive.openBox<Pet>("petBox");
    var userBox = await Hive.openBox<User>("test");

    petBox.deleteFromDisk();
    userBox.deleteFromDisk();
  }
}
