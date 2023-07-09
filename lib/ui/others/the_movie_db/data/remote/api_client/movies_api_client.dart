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

  Future<MovieDetailsEntity> getDetails(int movieId, String language) {
    final result = _baseApiClient.get(
        "${MovieDbConstants.movieDetails}$movieId?",
        _movieDetailsParser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "language": language,
      "append_to_response": "credits,videos"
    });
    return result;
  }

  bool _isMovieSavedParser(dynamic json) {
    final jsonMap = json as Map<String, dynamic>;
    final result = jsonMap["favorite"] as bool;
    return result;
  }

  Future<bool> isMovieSaved(int movieId, String sessionId) {
    final result = _baseApiClient.get("/movie/$movieId/account_states?",
        _isMovieSavedParser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "session_id": sessionId,
    });
    return result;
  }

  Future<int> saveMovie(
      {required int accountId,
      required String sessionId,
      required MediaType mediaType,
      required int mediaId,
      required bool isSaved}) async {
    parser(dynamic json) {
      return 1;
    }

    final result = _baseApiClient
        .post("/account/$accountId/favorite?", parser, <String, dynamic>{
      "media_type": mediaType.asString(),
      "media_id": mediaId,
      "favorite": isSaved
    }, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "session_id": sessionId
    });
    return result;
  }
}
