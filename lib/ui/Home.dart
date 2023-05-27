import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              children: [
                const Text("2month"),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, "/hw6m2");
                    },
                    child: const Text(
                      "hw6",
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, "/hw7m2");
                    },
                    child: const Text(
                      "hw7",
                    ))
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/telegramSettings");
                    },
                    child: const Text("telegramSettings"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
