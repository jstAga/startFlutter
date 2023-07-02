import 'package:hive_flutter/adapters.dart';

part 'group.g.dart';

@HiveType(typeId: 2)
class Group extends HiveObject{

  @HiveField(0)
  final String groupName;

  Group({required this.groupName});
}
