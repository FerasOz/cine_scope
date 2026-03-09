import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';

enum MediaType { movie, tv }

@JsonSerializable()
class MediaModel {
  final int id;

  // movie: title
  // tv: name
  @JsonKey(name: 'title')
  final String? movieTitle;

  @JsonKey(name: 'name')
  final String? tvTitle;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'vote_average')
  final double rating;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  MediaModel({
    required this.id,
    this.movieTitle,
    this.tvTitle,
    this.posterPath,
    this.backdropPath,
    required this.rating,
    this.releaseDate,
    this.firstAirDate,
    this.mediaType,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);

  String get title => movieTitle ?? tvTitle ?? '';

  String? get date => releaseDate ?? firstAirDate;

  String get year =>
      date != null && date!.isNotEmpty ? date!.split('-').first : '';

  MediaType get type {
    if (mediaType == 'tv') {
      return MediaType.tv;
    }
    return MediaType.movie;
  }
}
