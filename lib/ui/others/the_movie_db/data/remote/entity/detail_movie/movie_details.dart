import 'package:json_annotation/json_annotation.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/entity/data_ext.dart';
import 'package:start_flutter/ui/others/the_movie_db/data/remote/movie_db_constants.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsEntity {
  MovieDetailsEntity({
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
    this.spokenLanguages,
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
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? releaseDate;
  final num? revenue;
  final num? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;

  get allGenres {
    String result = "";
    if (genres == null) result = "No genres";

    for (int i = 0; i < genres!.length; i++) {
      if (genres!.length - 1 != i) {
        result += "${genres![i].name}, ";
      } else {
        result += "${genres![i].name}";
      }
    }
    return result;
  }

  get allCountries {
    String result = "";
    if (productionCountries == null) result = "No countries";

    for (int i = 0; i < productionCountries!.length; i++) {
      if (productionCountries!.length - 1 != i) {
        result += "${productionCountries![i].iso}, ";
      } else {
        result += "${productionCountries![i].iso}";
      }
    }
    return result;
  }

  factory MovieDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsEntityToJson(this);

  get image => MovieDbConstants.baseImage + (posterPath ?? "");
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
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

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Genres {
  Genres({
    this.id,
    this.name,
  });

  final num? id;
  final String? name;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
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

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
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

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProductionCountries {
  ProductionCountries({
    this.iso,
    this.name,
  });

  @JsonKey(name: "iso_3166_1")
  final String? iso;
  final String? name;

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}
