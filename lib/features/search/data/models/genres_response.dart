import 'package:json_annotation/json_annotation.dart';
import 'genre_model.dart';

part 'genres_response.g.dart';

@JsonSerializable()
class GenresResponse {
  final List<GenreModel> genres;

  GenresResponse({
    required this.genres,
  });

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}