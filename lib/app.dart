import 'package:flutter/material.dart';

import 'package:start_flutter/ui/geek_tech/2month/hw6m2.dart';
import 'package:start_flutter/ui/geek_tech/2month/hw7m2/hw7m2.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/home/love_home_widget.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/result/love_result_widget.dart';
import 'package:start_flutter/ui/others/the_movie_db/core/constants.dart';
import 'package:start_flutter/ui/others/telegram_settings/telegram_settings.dart';
import 'package:start_flutter/ui/others/the_movie_db/auth/auth.dart';
import 'package:start_flutter/ui/others/the_movie_db/movieDetail/movie_detail.dart';
import 'package:start_flutter/ui/others/the_movie_db/movieHome/movie_home.dart';
import 'package:start_flutter/ui/others/todo_list/ui/group_form/group_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/groups/groups_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/task_from/task_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // const Home home = Home();
    const Hw6m2 hw6m2 = Hw6m2();
    const Hw7m2 hw7m2 = Hw7m2();

    final TelegramSettings telegramSettings = TelegramSettings();

    const Auth authTheMovieDb = Auth();
    const MovieHome movieHome = MovieHome();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        // "/": (context) => home,
        "/": (context) => const GroupsWidget(),
        "/hw6m2": (context) => hw6m2,
        "/hw7m2": (context) => hw7m2,
        "/telegramSettings": (context) => telegramSettings,
        "/authTheMovieDB": (context) => authTheMovieDb,
        "/homeTheMovieDB": (context) => movieHome,
        "/homeTheMovieDB/movieDetail": (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          if (argument is int) {
            return MovieDetail(id: argument);
          }
          return const MovieDetail(id: 0);
        },
        "/loveCalculator": (context) => const LoveHomeWidget(),
        "/loveCalculator/result": (context) {
          final argument =
              ModalRoute.of(context)?.settings.arguments as LoveResponse;
          return LoveResultWidget(result: argument);
        },
        "/todoList" : (context) => const GroupsWidget(),
        "/todoList/groupForm" : (context) => const GroupFormWidget(),
        "/todoList/tasks" : (context) => const TasksWidget(),
        "/todoList/tasks/taskForm" : (context) => const TaskFormWidget(),
      },
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Constants.theMovieDbBackground),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Constants.theMovieDbBackground)),
    );
  }
}
