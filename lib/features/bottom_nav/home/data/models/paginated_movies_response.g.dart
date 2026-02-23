// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMoviesResponse _$PaginatedMoviesResponseFromJson(
  Map<String, dynamic> json,
) => PaginatedMoviesResponse(
  page: (json['page'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['total_pages'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedMoviesResponseToJson(
  PaginatedMoviesResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};
