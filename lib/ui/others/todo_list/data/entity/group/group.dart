import 'package:hive_flutter/adapters.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';

part 'group.g.dart';

@HiveType(typeId: 2)
class Group{

  @HiveField(0)
  final String groupName;

  @HiveField(1)
  HiveList<Task>? tasks;

  Group({required this.groupName});

  void addTask(Box<Task> box, Task task){
    tasks ??= HiveList(box);
    tasks?.add(task);
  }
}
