import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/movies_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/movie/movie_entity.dart';

class MoviesModel extends ChangeNotifier {
  final _apiClient = MoviesApiClient();
  final _movies = <MovieEntity>[];
  late DateFormat _date;
  late int _currentPage;
  late int _totalPages;
  bool _isLoading = false;
  String _local = "";

  List<MovieEntity> get movies => _movies;

  String date(DateTime? releaseDate) =>
      releaseDate != null ? _date.format(releaseDate) : "";

  void toDetail(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.pushNamed(context, MainNavigationRoutesNames.movieDetail,
        arguments: id);
  }

  void setupLocalization(BuildContext context) {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _date = DateFormat.yMMMd(local);
    _currentPage = 0;
    _totalPages = 1;
    movies.clear();
    _getMovies();
  }

  Future<void> _getMovies() async {
    if (_isLoading || _currentPage >= _totalPages) return;
    _isLoading = true;
    final nextPage = _currentPage + 1;
    try {
      final moviesResponse = await _apiClient.getMovies(nextPage, _local);
      _movies.addAll(moviesResponse.results);
      _currentPage = moviesResponse.page;
      _totalPages = moviesResponse.totalPages!;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
    }
  }

  void getCurrentMovieIndex(int index) {
    if (index < _movies.length - 1) return;
    _getMovies();
  }
}
