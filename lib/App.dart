import 'package:flutter/material.dart';
import 'package:start_flutter/ui/Home.dart';
import 'package:start_flutter/ui/geekTech/2month/hw6m2.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const Home home = Home();
    const Hw6m2 hw6m2 = Hw6m2();
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => home,
          "/hw6m2": (context) => hw6m2,
        });
  }
}