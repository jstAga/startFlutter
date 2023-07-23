import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geek_tech/2month/hw6m2/hw6m2.dart';
import 'package:start_flutter/ui/geek_tech/2month/hw7m2/hw7m2.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/home/love_home_widget.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/result/love_result_widget.dart';
import 'package:start_flutter/ui/others/mvvm_counter/ui/screens/mvvm_counter_auth/mvvm_counter_auth_widget.dart';
import 'package:start_flutter/ui/others/telegram_settings/telegram_settings.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/auth/auth_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/auth/auth_widget.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieHome/movie_home_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieHome/movie_home_widget.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieTrailer/movie_trailer_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/group_form/group_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/groups/groups_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/task_from/task_form_widget.dart';
import 'package:start_flutter/ui/others/todo_list/ui/tasks/tasks_widget.dart';
import 'package:start_flutter/ui/others/work_with_hive/ui/work_with_hive_widget.dart';

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
  static const movieTrailer = "homeTheMovieDB/movieDetail/trailer";

  //todoList
  static const groups = "todoList";
  static const groupForm = "todoList/groupForm";
  static const tasks = "todoList/tasks";
  static const taskForm = "todoList/tasks/taskForm";

  static const workWithHttp = "workWithHttp";
  static const mvvmCounter = "mvvmCounter";
}

class MainNavigation {
  // final initialRoute = MainNavigationRoutesNames.authMovieDb;
  final initialRoute = MainNavigationRoutesNames.mvvmCounter;

  String initialRoute2(bool isAuth) => isAuth //movieDb
      ? MainNavigationRoutesNames.homeMovieDb
      : MainNavigationRoutesNames.authMovieDb;

  final routes = <String, Widget Function(BuildContext)>{
    //geek tech homeworks
    MainNavigationRoutesNames.hw6m2: (context) => const Hw6m2(),
    MainNavigationRoutesNames.hw7m2: (context) => const Hw7m2(),
    MainNavigationRoutesNames.telegramSettings: (context) => TelegramSettings(),

    //movieDb
    MainNavigationRoutesNames.authMovieDb: (context) =>
        NotifierProvider(create: () => AuthModel(), child: const AuthWidget()),
    MainNavigationRoutesNames.homeMovieDb: (context) => NotifierProvider(
        create: () => MovieHomeModel(), child: const MovieHomeWidget()),

    //love calculator
    MainNavigationRoutesNames.loveCalculator: (context) =>
        const LoveHomeWidget(),
    MainNavigationRoutesNames.loveCalculatorResult: (context) {
      final argument =
          ModalRoute.of(context)?.settings.arguments as LoveResponse;
      return LoveResultWidget(response: argument);
    },

    //todoList
    MainNavigationRoutesNames.groups: (context) => const GroupsWidget(),
    MainNavigationRoutesNames.groupForm: (context) => const GroupFormWidget(),

    //workWithHttp
    MainNavigationRoutesNames.workWithHttp: (context) =>
        const WorkWithHiveWidget(),
    //workWithHttp
    MainNavigationRoutesNames.mvvmCounter: (context) => MvvmCounterAuthWidget.create(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //movieDb
      case MainNavigationRoutesNames.movieDetail:
        final args = settings.arguments;
        final movieId = args is int ? args : 0;
        return MaterialPageRoute(builder: (context) {
          return NotifierProvider(
              create: () => MovieDetailsModel(movieId: movieId),
              child: const MovieDetailsWidget());
        });
      case MainNavigationRoutesNames.movieTrailer:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments;
          final trailerKey = args is String ? args : "";
          return MovieTrailerWidget(
            trailerKey: trailerKey,
          );
        });
      //love calculator
      case MainNavigationRoutesNames.loveCalculatorResult:
        return MaterialPageRoute(builder: (context) {
          return LoveResultWidget(response: settings.arguments as LoveResponse);
        });
      //todoList
      case MainNavigationRoutesNames.tasks:
        return MaterialPageRoute(builder: (context) {
          return TasksWidget(
              configuration: settings.arguments as TasksWidgetConfiguration);
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
