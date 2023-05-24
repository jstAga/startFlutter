import 'package:flutter/material.dart';

class Hw6m2 extends StatefulWidget {
  const Hw6m2({super.key});

  @override
  State<StatefulWidget> createState() => _Hw6m2();
}

class _Hw6m2 extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg_hw6_m2.jpeg"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(children: [
                const Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                  "Sign in",
                ),
                const Text(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                  "Welcome!",
                ),
                const Text(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  "Sign in or register",
                ),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ("Lalala")),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ("Lalala")),
                ),
                TextButton(onPressed: () {}, child: const Text("Sign in")),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {},
                        child: const Text("Sign in"))),
              ]),
            )));
  }
}