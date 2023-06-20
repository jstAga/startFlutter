import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/geekTech/5month/love_calculator/core/love_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoveResultWidget extends StatefulWidget {
  const LoveResultWidget(
      {super.key, required this.firstName, required this.secondName});

  final String firstName;
  final String secondName;
  final int percent = 83;

  @override
  State<LoveResultWidget> createState() => _LoveResultWidgetState();
}

class _LoveResultWidgetState extends State<LoveResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage(Images.love_calculator_bg_result)),
            const _TitleWidget(),
            const SizedBox(height: 12),
            Text(widget.firstName, style: LoveConstants.baseResultText),
            const SizedBox(height: 12),
            const Icon(
              Icons.heart_broken_sharp,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(widget.secondName, style: LoveConstants.baseResultText),
            const SizedBox(height: 12),
            _Percent(percent: widget.percent),
            const SizedBox(height: 12),
            const _TryAgainButton()
          ],
        ),
      ),
    );
  }
}

class _TryAgainButton extends StatelessWidget {
  const _TryAgainButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, "/loveCalculator"),
        style: LoveConstants.baseLoveButton,
        child: const Text(
          "Try again",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Text("Your score",
        style: TextStyle(
            color: LoveConstants.pink,
            fontSize: 28,
            fontWeight: FontWeight.bold));
  }
}

class _Percent extends StatelessWidget {
  final int percent;

  const _Percent({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SvgPicture.asset(Images.ic_heart_plus, width: 100, height: 100),
      Text("$percent%", style: LoveConstants.baseHomeText)
    ]);
  }
}
