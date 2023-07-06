import 'package:flutter/material.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/movies_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/movie/movie_entity.dart';

class MoviesModel extends ChangeNotifier {
  final _apiClient = MoviesApiClient();
  final _movies = <MovieEntity>[];

  List<MovieEntity> get movies => List.unmodifiable(_movies);

  Future<void> getMovies() async {
    final moviesResponse = await _apiClient.getMovies(1, "ru-RU");
    _movies.addAll(moviesResponse.results);
    notifyListeners();
  }

  void toDetail(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.pushNamed(context, MainNavigationRoutesNames.movieDetail,
        arguments: id);
  }
}
