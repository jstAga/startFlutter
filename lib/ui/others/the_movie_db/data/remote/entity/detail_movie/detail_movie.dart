import 'package:json_annotation/json_annotation.dart';

part 'detail_movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DetailMovieEntity {
  DetailMovieEntity({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    // this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final num? budget;
  final List<Genres>? genres;
  final String? homepage;
  final num? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? releaseDate;
  final num? revenue;
  final num? runtime;
  // final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;

  static DateTime? _parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class BelongsToCollection {
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  final num? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class Genres {
  Genres({
    this.id,
    this.name,
  });

  final num? id;
  final String? name;
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  num? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso,
    this.name,
  });

  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso;
  final String? name;
}

@JsonSerializable(fieldRename: FieldRename.snake,explicitToJson: true)
class ProductionCountries {
  ProductionCountries({
    @JsonKey(name: "iso_3166_1") this.iso,
    this.name,
  });

  final String? iso;
  final String? name;
}
