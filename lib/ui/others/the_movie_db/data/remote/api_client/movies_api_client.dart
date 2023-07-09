import 'dart:io';

import 'package:start_flutter/ui/others/the_movie_db/data/core/network/base_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/detail_movie/movie_details.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/movie_response/movie_response.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

class MoviesApiClient {
  final _baseApiClient = BaseApiClient(
      host: MovieDbConstants.baseUrl,
      client: HttpClient(),
      apiKey: MovieDbConstants.apiKey);

  MovieResponse _movieResponseParser(dynamic json) {
    final jsonMap = json as Map<String, dynamic>;
    final response = MovieResponse.fromJson(jsonMap);
    return response;
  }

  Future<MovieResponse> getMovies(int page, String language) async {
    final result = _baseApiClient.get(
        MovieDbConstants.getMovies, _movieResponseParser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "page": page.toString(),
      "language": language,
    });
    return result;
  }

  Future<MovieResponse> searchMovies(String query, int page, String language) {
    final result = _baseApiClient.get(
        MovieDbConstants.searchMovie, _movieResponseParser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "query": query,
      "page": page.toString(),
      "language": language,
    });
    return result;
  }

  MovieDetailsEntity _movieDetailsParser(dynamic json) {
    final jsonMap = json as Map<String, dynamic>;
    final response = MovieDetailsEntity.fromJson(jsonMap);
    return response;
  }

  Future<MovieDetailsEntity> getDetails(int id, String language) {
    final result = _baseApiClient.get(
        "${MovieDbConstants.movieDetails}$id", _movieDetailsParser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "movie_id": id,
      "language": language,
    });
    return result;
  }
}
