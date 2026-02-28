import 'package:json_annotation/json_annotation.dart';

part 'watchlist_movie.g.dart';

@JsonSerializable()
class WatchlistMovie {
  final int id;
  final String title;
  final String? posterPath;
  final double voteAverage;

  WatchlistMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  factory WatchlistMovie.fromJson(Map<String, dynamic> json) =>
      _$WatchlistMovieFromJson(json);

  Map<String, dynamic> toJson() => _$WatchlistMovieToJson(this);
}
