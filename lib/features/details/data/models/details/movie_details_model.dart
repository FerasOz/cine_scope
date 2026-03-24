import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MediaDetailsModel {
  final int id;

  @JsonKey(name: 'title')
  final String? movieTitle;

  @JsonKey(name: 'name')
  final String? tvTitle;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  /// movie
  final int? runtime;

  /// tv
  @JsonKey(name: 'episode_run_time')
  final List<int>? episodeRunTime;

  final List<GenreModel> genres;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  final double popularity;

  MediaDetailsModel({
    required this.id,
    this.movieTitle,
    this.tvTitle,
    this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
    this.firstAirDate,
    this.runtime,
    this.episodeRunTime,
    required this.genres,
    required this.originalLanguage,
    required this.popularity,
  });

  factory MediaDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MediaDetailsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaDetailsModelToJson(this);

  /// عنوان موحد
  String get title => movieTitle ?? tvTitle ?? '';

  /// تاريخ موحد
  String? get date => releaseDate ?? firstAirDate;

  String get year =>
      date != null && date!.isNotEmpty
          ? date!.split('-').first
          : '';

  /// مدة موحدة
  int get duration {
    if (runtime != null) return runtime!;
    if (episodeRunTime != null &&
        episodeRunTime!.isNotEmpty) {
      return episodeRunTime!.first;
    }
    return 0;
  }

  String get genresText =>
      genres.map((e) => e.name).join(', ');
}

@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
