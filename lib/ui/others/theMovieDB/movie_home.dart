import 'package:flutter/material.dart';
import 'package:start_flutter/ui/geekTech/utils/Constants.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  int _selectedTab = 1;

  static const List<Widget> _bottomNav = [
    Text("Movies"),
    Text("Home"),
    Text("Tv shows")
  ];

  void _onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.theMovieDbHomeTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie, color: Colors.white), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV shows")
        ],
        onTap: _onSelectedTab,
      ),
      body: Center(
        child: _bottomNav[_selectedTab],
      ),
    );
  }
}
