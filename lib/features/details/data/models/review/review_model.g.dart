// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  author: json['author'] as String,
  content: json['content'] as String,
  authorDetails: json['author_details'] == null
      ? null
      : AuthorDetails.fromJson(json['author_details'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'author_details': instance.authorDetails,
    };

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) =>
    AuthorDetails(avatarPath: json['avatar_path'] as String?);

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{'avatar_path': instance.avatarPath};
