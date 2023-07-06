import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

part 'movie_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieEntity {
  MovieEntity({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.videoCount,
    required this.video,
    required this.voteAverage,
  });

  final bool? adult;
  final String? backdropPath;
  List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? videoCount;

  get image => MovieDbConstants.baseImage + (posterPath ?? "");

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);

  static DateTime? _parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}
