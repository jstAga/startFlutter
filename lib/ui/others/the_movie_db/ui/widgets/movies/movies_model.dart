import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/movies_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/movie/movie_entity.dart';

class MoviesModel extends ChangeNotifier {
  final _apiClient = MoviesApiClient();
  final _movies = <MovieEntity>[];
  late DateFormat _date;
  String _local = "";

  List<MovieEntity> get movies => _movies;

  String date(DateTime? releaseDate) =>
      releaseDate != null ? _date.format(releaseDate) : "";

  void setupLocalization(BuildContext context) {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _date = DateFormat.yMMMd(local);
    movies.clear();
    _getMovies();
  }

  Future<void> _getMovies() async {
    final moviesResponse = await _apiClient.getMovies(1, _local);
    _movies.addAll(moviesResponse.results);
    notifyListeners();
  }

  void toDetail(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.pushNamed(context, MainNavigationRoutesNames.movieDetail,
        arguments: id);
  }
}
