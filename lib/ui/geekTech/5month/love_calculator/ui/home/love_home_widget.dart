import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';

const Color pink = Color.fromRGBO(240, 184, 210, 1.000);

class LoveHomeWidget extends StatefulWidget {
  const LoveHomeWidget({super.key});

  @override
  State<LoveHomeWidget> createState() => _LoveHomeWidgetState();
}

class _LoveHomeWidgetState extends State<LoveHomeWidget> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400);
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(Images.hw2m5_home_bg)),
            _TitleWidget(),
            _FirstNameWidget(textStyle: textStyle),
            _FirstNameFieldWidget(),
            _SecondNameWidget(textStyle: textStyle),
            _SecondNameFieldWidget(),
            SizedBox(height: 8),
            _CalculateButton()
          ],
        ),
      ),
    );
  }
}

class _SecondNameFieldWidget extends StatelessWidget {
  const _SecondNameFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Second name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(28))),
      ),
    );
  }
}

class _FirstNameFieldWidget extends StatelessWidget {
  const _FirstNameFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
            hintText: "First name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(28))),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text("Love calculator",
          style: TextStyle(
              color: pink, fontSize: 28, fontWeight: FontWeight.bold)),
    );
  }
}

class _SecondNameWidget extends StatelessWidget {
  const _SecondNameWidget({
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text("Second name", style: textStyle),
    );
  }
}

class _FirstNameWidget extends StatelessWidget {
  const _FirstNameWidget({
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text("First name", style: textStyle),
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(pink),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 40)),
          ),
          child: const Text(
            "Calculate",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
    );
  }
}
