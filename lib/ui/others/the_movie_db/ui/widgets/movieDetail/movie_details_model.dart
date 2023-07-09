import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/local/data_provider/session_data_provider.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/movies_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/detail_movie/movie_details.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

class MovieDetailsModel extends ChangeNotifier {
  MovieDetailsModel({required this.movieId});

  final _apiClient = MoviesApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final int movieId;
  MovieDetailsEntity? _movieDetails;
  String _local = "ru-Ru";
  bool _isMovieSaved = false;
  late DateFormat _date;

  MovieDetailsEntity? get movieDetails => _movieDetails;

  bool get isMovieSaved => _isMovieSaved;

  Future<void> setupLocalization(BuildContext context) async {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _date = DateFormat.yMMMd(local);
    await _getDetails();
  }

  Future<void> _getDetails() async {
    _movieDetails = await _apiClient.getDetails(movieId, _local);
    final sessionId = await _sessionDataProvider.getSessionId();
    if (sessionId != null) {
      _isMovieSaved = await _apiClient.isMovieSaved(movieId, sessionId);
    }
    notifyListeners();
  }

  Future<void> toggleSave() async {
    final accountId = await _sessionDataProvider.getAccountId();
    final sessionId = await _sessionDataProvider.getSessionId();

    if (sessionId == null || accountId == null) return;
    final isMovieSavedUpdated = !_isMovieSaved;
    _isMovieSaved = isMovieSavedUpdated;
    notifyListeners();
    await _apiClient.saveMovie(
        accountId: accountId,
        sessionId: sessionId,
        mediaType: MediaType.movie,
        mediaId: movieId,
        isSaved: isMovieSavedUpdated);
  }
}
