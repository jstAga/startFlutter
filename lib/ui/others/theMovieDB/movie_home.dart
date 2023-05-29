import 'package:flutter/material.dart';
import 'package:start_flutter/resources/Constants.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  int _selectedTab = 1;
  final TextEditingController controller = TextEditingController();

  
  void _onChanged(String text) {
    setState(() {
      print("t $text");
    });
  }

  void _onSubmitted() {
    print("editing complete");
  }

  // static final List<Widget> _bottomNav = [
  //   const Text("Movies"),
  //    TextField(
  //     controller: controller,
  //     decoration: InputDecoration(
  //         focusedBorder:
  //             OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
  //         border:
  //             OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
  //   ),
  //   const Text("Tv shows")
  // ];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              TextField(
                onEditingComplete: _onSubmitted,
              ),
              SizedBox(height: 20),
              TextField()
            ],
          ),
        ),
      ),
    );
  }
}
