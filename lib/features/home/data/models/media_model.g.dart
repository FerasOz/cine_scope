// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
  id: (json['id'] as num).toInt(),
  movieTitle: json['title'] as String?,
  tvTitle: json['name'] as String?,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  rating: (json['vote_average'] as num).toDouble(),
  releaseDate: json['release_date'] as String?,
  firstAirDate: json['first_air_date'] as String?,
  mediaType: json['media_type'] as String?,
);

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.movieTitle,
      'name': instance.tvTitle,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.rating,
      'release_date': instance.releaseDate,
      'first_air_date': instance.firstAirDate,
      'media_type': instance.mediaType,
    };
