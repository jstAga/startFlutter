import 'package:flutter/material.dart';
import 'package:start_flutter/ui/Home.dart';
import 'package:start_flutter/ui/geekTech/2month/hw6m2.dart';
import 'package:start_flutter/ui/geekTech/2month/hw7m2.dart';
import 'package:start_flutter/ui/geekTech/utils/Constants.dart';
import 'package:start_flutter/ui/others/telegram_settings.dart';
import 'package:start_flutter/ui/others/theMovieDB/auth.dart';
import 'package:start_flutter/ui/others/theMovieDB/movie_home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const Home home = Home();
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
        "/": (context) => movieHome,
        "/hw6m2": (context) => hw6m2,
        "/hw7m2": (context) => hw7m2,
        "/telegramSettings": (context) => telegramSettings,
        "/authTheMovieDB": (context) => authTheMovieDb,
        "/homeTheMovieDB": (context) => movieHome,
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
