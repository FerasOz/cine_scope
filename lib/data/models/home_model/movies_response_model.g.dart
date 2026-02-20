// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponseModel _$MoviesResponseModelFromJson(Map<String, dynamic> json) =>
    MoviesResponseModel(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResponseModelToJson(
  MoviesResponseModel instance,
) => <String, dynamic>{'page': instance.page, 'results': instance.results};
