import 'package:flutter/material.dart';
import 'package:start_flutter/resources/Constants.dart';

class MovieModel {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  MovieModel(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class Movies extends StatefulWidget {
  Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final _searchController = TextEditingController();
  var _filteredMovies = <MovieModel>[];

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = Constants.moviesData.where((MovieModel movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = Constants.moviesData;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = Constants.moviesData;
    _searchController.addListener(() {
      _searchMovies();
    });
  }

  void _onMovieTap(int index) {
    Navigator.pushNamed(context, "/homeTheMovieDB/movieDetail",
        arguments: _filteredMovies[index].id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2))
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie.title,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  const SizedBox(height: 5),
                                  Text(
                                    movie.time,
                                    maxLines: 1,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    movie.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: "Search",
                isDense: true,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        )
      ],
    );
  }
}
