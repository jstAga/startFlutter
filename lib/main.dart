import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/app/app.dart';
import 'package:start_flutter/app/app_model.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/pet/pet.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/user/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //if main is async
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PetAdapter());

  // movieDb check user is auth
  final model = AppModel();
  await model.checkAuth();
  final app = App(model: model);
  runApp(app);
}
