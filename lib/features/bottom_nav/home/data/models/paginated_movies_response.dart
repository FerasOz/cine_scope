import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'paginated_movies_response.g.dart';

@JsonSerializable()
class PaginatedMoviesResponse {
  final int page;
  final List<MovieModel> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  PaginatedMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMoviesResponseToJson(this);
}
