import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/core/love_constants.dart';

class HiveHistoryWidget extends StatefulWidget {
  const HiveHistoryWidget({super.key});

  @override
  State<HiveHistoryWidget> createState() => _HiveHistoryWidgetState();
}

class _HiveHistoryWidgetState extends State<HiveHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(image: AssetImage(Images.hw2m5HomeBg)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Text("History", style: LoveConstants.baseTitleText),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return _HistoryItem(index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 10);
                }),
          )
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Alex", style: LoveConstants.baseHomeText),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset(Images.icHeartPlus, width: 30, height: 30),
            const Text("=", style: TextStyle(fontSize: 30)),
            const Stack(
                alignment: Alignment.center,
                children: [Text("34%", style: LoveConstants.baseHomeText)])
          ]),
          const Text("Sara", style: LoveConstants.baseHomeText),
        ],
      ),
    );
  }
}
