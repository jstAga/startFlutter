import 'package:flutter/material.dart';
import 'package:start_flutter/resources/Constants.dart';

class TelegramSettings extends StatelessWidget {
  final List<_MenuRowData> _mainMenuRowData = [
    _MenuRowData(
      Icons.bookmark,
      Colors.blueAccent,
      "Favorites",
    ),
    _MenuRowData(
      Icons.phone,
      Colors.green,
      "Recent calls",
    ),
    _MenuRowData(
      Icons.devices,
      Colors.orangeAccent,
      "Devices",
    ),
    _MenuRowData(
      Icons.folder_copy,
      Colors.lightBlueAccent,
      "Chat folders",
    )
  ];

  final List<_MenuRowData> _secondaryMenuRowData = [
    _MenuRowData(Icons.notifications, Colors.red, "Notifications"),
    _MenuRowData(
      Icons.security,
      Colors.blueAccent,
      "Security",
    ),
    _MenuRowData(
      Icons.memory,
      Colors.green,
      "Data and memory",
    ),
    _MenuRowData(
      Icons.brush,
      Colors.blueAccent,
      "Design",
    ),
    _MenuRowData(
      Icons.language,
      Colors.purple,
      "Language",
    )
  ];

  TelegramSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.telegramBackground,
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _UserInfo(),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(
              menuRowData: _mainMenuRowData,
            ),
            const SizedBox(
              height: 20,
            ),
            _MenuWidget(
              menuRowData: _secondaryMenuRowData,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<_MenuRowData> menuRowData;

  const _MenuWidget({Key? key, required this.menuRowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      child: Column(
          children:
              menuRowData.map((i) => _MenuWidgetRow(widgetData: i)).toList()),
    );
  }
}

class _MenuRowData {
  final IconData icon;
  final Color color;
  final String text;

  _MenuRowData(this.icon, this.color, this.text);
}

class _MenuWidgetRow extends StatelessWidget {
  final _MenuRowData widgetData;

  const _MenuWidgetRow({required this.widgetData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: widgetData.color,
                borderRadius: BorderRadius.circular(4)),
            child: Icon(
              widgetData.icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(widgetData.text)),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: const Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _Avatar(),
              SizedBox(
                height: 20,
              ),
              _UserName(),
              SizedBox(
                height: 10,
              ),
              _UserPhone(),
              SizedBox(
                height: 10,
              ),
              _UserNickName(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: Text("Edit"),
        ),
        // Positioned(child: child)
      ],
    );
  }
}

class _UserNickName extends StatelessWidget {
  const _UserNickName();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "@flutter",
      style: TextStyle(color: Colors.grey, fontSize: 18),
    );
  }
}

class _UserPhone extends StatelessWidget {
  const _UserPhone();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "+996 (123) 45 67 89",
      style: TextStyle(color: Colors.grey, fontSize: 15),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Flutter Developer",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.person,
      size: 100,
    );
  }
}
