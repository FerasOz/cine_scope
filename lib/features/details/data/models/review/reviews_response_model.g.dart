// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsResponseModel _$ReviewsResponseModelFromJson(
  Map<String, dynamic> json,
) => ReviewsResponseModel(
  results: (json['results'] as List<dynamic>)
      .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReviewsResponseModelToJson(
  ReviewsResponseModel instance,
) => <String, dynamic>{'results': instance.results};
