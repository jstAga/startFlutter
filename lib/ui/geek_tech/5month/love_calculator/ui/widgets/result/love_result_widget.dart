import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/core/love_constants.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/result/love_result_model.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';

class LoveResultWidget extends StatefulWidget {
  final LoveResponse response;

  const LoveResultWidget({super.key, required this.response});

  @override
  State<LoveResultWidget> createState() => _LoveResultWidgetState();
}

class _LoveResultWidgetState extends State<LoveResultWidget> {
  late final LoveResultModel _model;
  
  @override
  void initState() {
    super.initState();
    _model = LoveResultModel(response: widget.response);
  }
  
  @override
  Widget build(BuildContext context) {
    return LoveResultProvider(
      model: _model,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(Images.loveCalculatorBgResult)),
              const _TitleWidget(),
              const SizedBox(height: 12),
              Text(widget.response.fname, style: LoveConstants.baseResultText),
              const SizedBox(height: 12),
              const Icon(
                Icons.heart_broken_sharp,
                color: Colors.red,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text(widget.response.sname, style: LoveConstants.baseResultText),
              const SizedBox(height: 12),
              _Percent(percent: widget.response.percentage),
              const SizedBox(height: 12),
              const _TryAgainButton()
            ],
          ),
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
        onPressed: () => Navigator.pushNamed(
            context, MainNavigationRoutesNames.loveCalculator),
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
  final String percent;

  const _Percent({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SvgPicture.asset(Images.icHeartPlus, width: 100, height: 100),
      Text("$percent%", style: LoveConstants.baseHomeText)
    ]);
  }
}
