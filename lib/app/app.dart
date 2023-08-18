import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/movie_db_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    // final model = InheritedProvider.read<AppModel>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // initialRoute: _mainNavigation.initialRoute2(model?.isAuth == true),
      initialRoute: _mainNavigation.initialRoute,
      routes: _mainNavigation.routes,
      onGenerateRoute: _mainNavigation.onGenerateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru', "RU"),
      ],
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: MovieDbConstants.theMovieDbBackground),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: MovieDbConstants.theMovieDbBackground)),
    );
  }
}
