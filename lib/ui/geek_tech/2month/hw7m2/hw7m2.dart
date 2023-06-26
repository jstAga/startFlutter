import 'package:flutter/material.dart';
import 'package:start_flutter/resources/constants.dart';

class Hw7m2 extends StatefulWidget {
  const Hw7m2({Key? key}) : super(key: key);

  @override
  State<Hw7m2> createState() => _Hw7m2State();
}

class _Hw7m2State extends State<Hw7m2> {
  int counter = 0;
  int first = 0;
  bool isOperationClicked = false;
  String operation = "";

  void onClick(String action) {
    try {
      onNumberClick(action);
    } on FormatException {
      onOperationClick(action);
    }
    setState(() {});
  }

  void onNumberClick(String action) {
    if (action == "AC") {
      counter = 0;
      first = 0;
      setState(() {});
    } else if (counter == 0 || isOperationClicked) {
      counter = int.parse(action);
    } else {
      counter = int.parse(counter.toString() + action);
    }
    isOperationClicked = false;
  }

  void onOperationClick(String action) {
    switch (action) {
      case "+/-":
        counter *= -1;
        break;
      case "÷":
        first = counter;
        operation = "/";
        break;
      case "×":
        first = counter;
        operation = "*";
        break;
      case "-":
        first = counter;
        operation = "-";
        break;
      case "+":
        first = counter;
        operation = "+";
        break;
      case "=":
        switch (operation) {
          case "+":
            counter += first;
            break;
          case "-":
            counter = first - counter;
            break;
          case "*":
            counter *= first;
            break;
          case "/":
            counter = first.toDouble() ~/ counter.toDouble();
            break;
        }
        break;
    }
    isOperationClicked = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.black,
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            _RowActions(onClick: onClick),
            const SizedBox(height: 16),
            _Row789(onClick: onClick),
            const SizedBox(height: 16),
            _Row456(onClick: onClick),
            const SizedBox(height: 16),
            _Row123(onClick: onClick),
            const SizedBox(height: 16),
            _RowZero(onClick: onClick),
            _TextCounter(counter: counter),
          ],
        ),
      ),
    ));
  }
}

class _TextCounter extends StatelessWidget {
  final int counter;

  const _TextCounter({
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        "$counter",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w200, fontSize: 80),
      ),
    );
  }
}

class _RowZero extends StatelessWidget {
  final Function onClick;

  const _RowZero({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false,
            background: Constants.lightGray,
            text: "AC",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.lightGray,
            text: "+/-",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.lightGray,
            text: "%",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.orange,
            text: "÷",
            onClick: onClick)
      ],
    );
  }
}

class _Row123 extends StatelessWidget {
  final Function onClick;

  const _Row123({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "7",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "8",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "9",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.orange,
            text: "×",
            onClick: onClick)
      ],
    );
  }
}

class _Row456 extends StatelessWidget {
  const _Row456({required this.onClick});

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "4",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "5",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "6",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.orange,
            text: "-",
            onClick: onClick)
      ],
    );
  }
}

class _Row789 extends StatelessWidget {
  final Function onClick;

  const _Row789({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "1",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "2",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: "3",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.orange,
            text: "+",
            onClick: onClick)
      ],
    );
  }
}

class _RowActions extends StatelessWidget {
  final Function onClick;

  const _RowActions({required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: true,
            background: Constants.darkGray,
            text: "0",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.darkGray,
            text: ".",
            onClick: onClick),
        _BaseTextButton(
            isZero: false,
            background: Constants.orange,
            text: "=",
            onClick: onClick)
      ],
    );
  }
}

class _BaseTextButton extends StatelessWidget {
  final Function onClick;
  final bool isZero;
  final Color background;
  final String text;

  const _BaseTextButton(
      {Key? key,
      required this.isZero,
      required this.background,
      required this.text,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(text),
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        minimumSize: MaterialStateProperty.all(Size(isZero ? 180 : 80, 80)),
        backgroundColor: MaterialStateProperty.all(background),
        foregroundColor: MaterialStateProperty.all(
            background == Constants.lightGray ? Colors.black : Colors.white),
      ),
      child: Text(
        text,
        textAlign: isZero ? TextAlign.start : TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
