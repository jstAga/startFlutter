import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/core/love_constants.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/hive_history/hive_history_model.dart';

class HiveHistoryWidget extends StatefulWidget {
  const HiveHistoryWidget({super.key});

  @override
  State<HiveHistoryWidget> createState() => _HiveHistoryWidgetState();
}

class _HiveHistoryWidgetState extends State<HiveHistoryWidget> {
  final HiveHistoryModel model = HiveHistoryModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: HiveHistoryProvider(
        model: model,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(Images.hw2m5HomeBg)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Text("History", style: LoveConstants.baseTitleText),
            ),
            _HistoryList()
          ],
        ),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList();

  @override
  Widget build(BuildContext context) {
    final itemCount =
        HiveHistoryProvider.watch(context)?.model.loveHistory.length;
    return Expanded(
      child: ListView.separated(
          itemCount: itemCount ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return _HistoryItem(index: index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 10);
          }),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final item = HiveHistoryProvider.read(context)!.model.loveHistory[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.fname, style: LoveConstants.baseHomeText),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset(Images.icHeartPlus, width: 30, height: 30),
            const Text("=", style: TextStyle(fontSize: 30)),
            Stack(alignment: Alignment.center, children: [
              Text(item.percentage, style: LoveConstants.baseHomeText)
            ])
          ]),
          Text(item.sname, style: LoveConstants.baseHomeText),
        ],
      ),
    );
  }
}
