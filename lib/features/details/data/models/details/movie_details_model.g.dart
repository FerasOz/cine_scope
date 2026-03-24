// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDetailsModel _$MediaDetailsModelFromJson(Map<String, dynamic> json) =>
    MediaDetailsModel(
      id: (json['id'] as num).toInt(),
      movieTitle: json['title'] as String?,
      tvTitle: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      releaseDate: json['release_date'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalLanguage: json['original_language'] as String,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$MediaDetailsModelToJson(MediaDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.movieTitle,
      'name': instance.tvTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'release_date': instance.releaseDate,
      'first_air_date': instance.firstAirDate,
      'runtime': instance.runtime,
      'episode_run_time': instance.episodeRunTime,
      'genres': instance.genres,
      'original_language': instance.originalLanguage,
      'popularity': instance.popularity,
    };

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) =>
    GenreModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
