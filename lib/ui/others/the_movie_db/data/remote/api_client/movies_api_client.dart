import 'dart:io';

import 'package:start_flutter/ui/others/the_movie_db/data/core/network/base_api_client.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/movie_response/movie_response.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

class MoviesApiClient {
  final _baseApiClient = BaseApiClient(
      host: MovieDbConstants.baseUrl,
      client: HttpClient(),
      apiKey: MovieDbConstants.apiKey);

  Future<MovieResponse> getMovies(int page, String language) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieResponse.fromJson(jsonMap);
      return response;
    }

    final result = _baseApiClient
        .get(MovieDbConstants.getMovies, parser, <String, dynamic>{
      "api_key": MovieDbConstants.apiKey,
      "page": page.toString(),
      "language": language,
    });

    return result;
  }
}
