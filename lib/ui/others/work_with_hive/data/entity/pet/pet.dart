import 'package:hive/hive.dart';

part 'pet.g.dart';

@HiveType(typeId: 1)
class Pet extends HiveObject {
  @HiveField(0)
  final String name;

  Pet(this.name);
}
