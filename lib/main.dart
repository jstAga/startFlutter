import 'package:flutter/material.dart';
import 'package:start_flutter/hw6m2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(),
          "/hw6m2": (context) => const Hw6m2(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
              children: [
          Row(
          children: [
          const Text("2month"),
          const SizedBox(width: 20,),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, "/hw6m2");
              },
              child: const Text(
                "hw6",
              ))
          ],
        ),],
        ),
      ),
    ),);
  }
}
