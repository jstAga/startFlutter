import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geekTech/utils/Constants.dart';

class Hw7m2 extends StatefulWidget {
  const Hw7m2({Key? key}) : super(key: key);

  @override
  State<Hw7m2> createState() => _Hw7m2State();
}

class _Hw7m2State extends State<Hw7m2> {
  int counter = 0;

  void inc() {
    setState(() {
      counter++;
    });
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
            const _RowActions(),
            const SizedBox(
              height: 16,
            ),
            const _Row789(),
            const SizedBox(
              height: 16,
            ),
            const _Row456(),
            const SizedBox(
              height: 16,
            ),
            const _Row123(),
            const SizedBox(
              height: 16,
            ),
            const _RowZero(),
            _TextCounter(counter: counter),
          ],
        ),
      ),
    ));
  }
}

class _TextCounter extends StatelessWidget {
  const _TextCounter({
    required this.counter,
  });

  final int counter;

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
  const _RowZero();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false, background: Constants.lightGray, text: "AC"),
        _BaseTextButton(
            isZero: false, background: Constants.lightGray, text: "+/-"),
        _BaseTextButton(
            isZero: false, background: Constants.lightGray, text: "%"),
        _BaseTextButton(isZero: false, background: Constants.orange, text: "÷")
      ],
    );
  }
}

class _Row123 extends StatelessWidget {
  const _Row123();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "7"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "8"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "9"),
        _BaseTextButton(isZero: false, background: Constants.orange, text: "×")
      ],
    );
  }
}

class _Row456 extends StatelessWidget {
  const _Row456();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "4"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "5"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "6"),
        _BaseTextButton(isZero: false, background: Constants.orange, text: "-")
      ],
    );
  }
}

class _Row789 extends StatelessWidget {
  const _Row789();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "1"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "2"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "3"),
        _BaseTextButton(isZero: false, background: Constants.orange, text: "+")
      ],
    );
  }
}

class _RowActions extends StatelessWidget {
  const _RowActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _BaseTextButton(
            isZero: true, background: Constants.darkGray, text: "0"),
        _BaseTextButton(
            isZero: false, background: Constants.darkGray, text: "."),
        _BaseTextButton(isZero: false, background: Constants.orange, text: "=")
      ],
    );
  }
}

class _BaseTextButton extends StatelessWidget {
  final bool isZero;
  final Color background;
  final String text;

  const _BaseTextButton(
      {Key? key,
      required this.isZero,
      required this.background,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // onPressed: () {},
      onPressed: () {},
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