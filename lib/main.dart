import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_flutter/app/app.dart';
import 'package:start_flutter/app/app_view_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/pet/pet.dart';
import 'package:start_flutter/ui/others/work_with_hive/data/entity/user/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //if main is async
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PetAdapter());

  // movieDb check user is auth
  final viewModel = AppViewModel();
  await viewModel.checkAuth();
  const app = App();
  final widget = InheritedProvider(model: viewModel, child: app);
  runApp(widget);
}
