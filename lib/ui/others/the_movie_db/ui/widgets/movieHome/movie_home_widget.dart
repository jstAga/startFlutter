import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/local/data_provider/session_data_provider.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/movie_db_constants.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movies/movies_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movies/movies_widget.dart';

class MovieHomeWidget extends StatefulWidget {
  const MovieHomeWidget({Key? key}) : super(key: key);

  @override
  State<MovieHomeWidget> createState() => _MovieHomeWidgetState();
}

class _MovieHomeWidgetState extends State<MovieHomeWidget> {
  final movieModel = MoviesModel();
  int _selectedTab = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieModel.setupLocalization(context);
  }

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
        title: const Text(MovieDbConstants.theMovieDbHomeTitle),
        actions: [
          IconButton(
              onPressed: () => SessionDataProvider().setSessionId(null),
              icon: const Icon(Icons.logout))
        ],
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
      body: IndexedStack(
        index: _selectedTab,
        children: [
          BaseNotifierProvider(model: movieModel, child: const Movies()),
          const Text("Home"),
          const Text("Tv shows")
        ],
      ),
    );
  }
}
