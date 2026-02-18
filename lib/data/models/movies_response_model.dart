import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'movies_response_model.g.dart';

@JsonSerializable()
class MoviesResponseModel {
  final int page;
  final List<MovieModel> results;

  MoviesResponseModel({
    required this.page,
    required this.results,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseModelToJson(this);
}