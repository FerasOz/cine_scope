// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchlistMovie _$WatchlistMovieFromJson(Map<String, dynamic> json) =>
    WatchlistMovie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['posterPath'] as String?,
      voteAverage: (json['voteAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$WatchlistMovieToJson(WatchlistMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'voteAverage': instance.voteAverage,
    };
