import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/app.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/group/group.dart';
import 'package:start_flutter/ui/others/todo_list/data/entity/task/task.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/pet/pet.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/user/user.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //if main is async
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PetAdapter());
  Hive.registerAdapter(GroupAdapter());
  Hive.registerAdapter(TaskAdapter());
  runApp(const App());
}