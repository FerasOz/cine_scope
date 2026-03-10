// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchlistModel _$WatchlistModelFromJson(Map<String, dynamic> json) =>
    WatchlistModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      type: $enumDecodeNullable(_$MediaTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$WatchlistModelToJson(WatchlistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'voteAverage': instance.voteAverage,
      'type': _$MediaTypeEnumMap[instance.type],
    };

const _$MediaTypeEnumMap = {MediaType.movie: 'movie', MediaType.tv: 'tv'};
