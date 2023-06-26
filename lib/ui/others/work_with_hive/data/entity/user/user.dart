import 'package:hive/hive.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/pet/pet.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  HiveList<Pet> pets;

  User(this.name, this.age, this.pets);

  @override
  String toString() => "Name: $name, age: $age, pets: $pets";
}

// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final typeId = 0;
//
//   @override
//   User read(BinaryReader reader) {
//     final name = reader.readString();
//     final age = reader.readInt();
//     return User(name, age);
//   }
//
//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.writeString(obj.name);
//     writer.writeInt(obj.age);
//   }
// }
