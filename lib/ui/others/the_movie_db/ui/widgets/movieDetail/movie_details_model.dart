import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/api_client/movies_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/detail_movie/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier {
  MovieDetailsModel({required this.movieId});

  final _apiClient = MoviesApiClient();
  final int movieId;
  MovieDetailsEntity? _movieDetails;
  late String _local;
  late DateFormat _date;

  MovieDetailsEntity? get movieDetails => _movieDetails;

  Future<void> setupLocalization(BuildContext context) async {
    final local = Localizations.localeOf(context).toLanguageTag();
    if (_local == local) return;
    _local = local;
    _date = DateFormat.yMMMd(local);
    await _getDetails();
  }

  Future<void> _getDetails() async {
    _movieDetails = await _apiClient.getDetails(movieId, _local);
    notifyListeners();
  }
}
