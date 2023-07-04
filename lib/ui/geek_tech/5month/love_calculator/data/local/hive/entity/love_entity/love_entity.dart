import 'package:hive_flutter/adapters.dart';

part 'love_entity.g.dart';

@HiveType(typeId: 4)
class LoveEntity {
  @HiveField(0)
  final String fname;
  @HiveField(1)
  final String sname;
  @HiveField(2)
  final String percentage;
  @HiveField(3)
  final String result;

  LoveEntity(
      {required this.fname,
      required this.sname,
      required this.percentage,
      required this.result});
}
