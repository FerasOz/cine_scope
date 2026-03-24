import 'package:json_annotation/json_annotation.dart';
import 'media_model.dart';

part 'paginated_media_response.g.dart';

@JsonSerializable()
class PaginatedMediaResponse {
  final int page;

  final List<MediaModel> results;

  @JsonKey(name: "total_pages")
  final int totalPages;

  @JsonKey(name: "total_results")
  final int totalResults;

  PaginatedMediaResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedMediaResponseToJson(this);
}
