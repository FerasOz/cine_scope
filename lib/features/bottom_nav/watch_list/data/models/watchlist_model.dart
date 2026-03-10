import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'watchlist_model.g.dart';

@JsonSerializable()
class WatchlistModel {
  final int id;
  final String title;
  final String? posterPath;
    final String? backdropPath;
  final double voteAverage;
  final MediaType? type;

  WatchlistModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.type,
  });

  factory WatchlistModel.fromJson(Map<String, dynamic> json) =>
      _$WatchlistModelFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistModelToJson(this);

  MediaType get safeType => type ?? MediaType.movie;
}
