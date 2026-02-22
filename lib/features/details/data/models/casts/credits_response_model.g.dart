// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsResponseModel _$CreditsResponseModelFromJson(
  Map<String, dynamic> json,
) => CreditsResponseModel(
  cast: (json['cast'] as List<dynamic>)
      .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreditsResponseModelToJson(
  CreditsResponseModel instance,
) => <String, dynamic>{'cast': instance.cast};
