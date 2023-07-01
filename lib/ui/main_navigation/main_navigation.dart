import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geek_tech/2month/hw6m2/hw6m2.dart';
import 'package:start_flutter/ui/geek_tech/2month/hw7m2/hw7m2.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/home/love_home_widget.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/result/love_result_widget.dart';
import 'package:start_flutter/ui/others/telegram_settings/telegram_settings.dart';
import 'package:start_flutter/ui/others/the_movie_db/auth/auth.dart';
import 'package:start_flutter/ui/others/the_movie_db/movieDetail/movie_detail.dart';
import 'package:start_flutter/ui/others/the_movie_db/movieHome/movie_home.dart';
import 'package:start_flutter/ui/others/todo_list/ui/group_form/group_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/groups/groups_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/task_from/task_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_widget.dart';

abstract class MainNavigationRoutesNames {
  //geekTech
  static const hw6m2 = "hw6m2";
  static const hw7m2 = "hw7m2";
  static const loveCalculator = "loveCalculator";
  static const loveCalculatorResult = "loveCalculator/result";

  //practicing layout
  static const telegramSettings = "telegramSettings";
  static const bankingApp = "bankingApp";

  //the movie db
  static const authMovieDb = "authTheMovieDB";
  static const homeMovieDb = "homeTheMovieDB";
  static const movieDetail = "homeTheMovieDB/movieDetail";

  //todoList
  static const groups = "todoList";
  static const groupForm = "todoList/groupForm";
  static const tasks = "todoList/tasks";
  static const taskForm = "todoList/tasks/taskForm";
}

class MainNavigation {
  final initialRoute = MainNavigationRoutesNames.groups;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.hw6m2: (context) => const Hw6m2(),
    MainNavigationRoutesNames.hw7m2: (context) => const Hw7m2(),
    MainNavigationRoutesNames.telegramSettings: (context) => TelegramSettings(),
    MainNavigationRoutesNames.authMovieDb: (context) => const Auth(),
    MainNavigationRoutesNames.homeMovieDb: (context) => const MovieHome(),
    MainNavigationRoutesNames.movieDetail: (context) {
      final argument = ModalRoute.of(context)?.settings.arguments;
      if (argument is int) {
        return MovieDetail(id: argument);
      }
      return const MovieDetail(id: 0);
    },
    MainNavigationRoutesNames.loveCalculator: (context) =>
        const LoveHomeWidget(),
    MainNavigationRoutesNames.loveCalculatorResult: (context) {
      final argument =
          ModalRoute.of(context)?.settings.arguments as LoveResponse;
      return LoveResultWidget(result: argument);
    },
    MainNavigationRoutesNames.groups: (context) => const GroupsWidget(),
    MainNavigationRoutesNames.groupForm: (context) => const GroupFormWidget(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.tasks:
        return MaterialPageRoute(builder: (context) {
          return TasksWidget(groupKey: settings.arguments as int);
        });

      case MainNavigationRoutesNames.taskForm:
        return MaterialPageRoute(builder: (context) {
          return TaskFormWidget(groupKey: settings.arguments as int);
        });

      default:
        return MaterialPageRoute(builder: (context) => const Text("nav error"));
    }
  }
}
