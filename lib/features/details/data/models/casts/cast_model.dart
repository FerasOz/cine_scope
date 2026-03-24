import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel {
  final int id;
  final String name;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  final String character;

  CastModel({
    required this.id,
    required this.name,
    this.profilePath,
    required this.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);

  String get imageUrl =>
      profilePath != null
          ? "https://image.tmdb.org/t/p/w500$profilePath"
          : "";
}