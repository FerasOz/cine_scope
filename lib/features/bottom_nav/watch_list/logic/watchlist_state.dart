import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';

class WatchlistState {
  final List<WatchlistMovie> movies;

  const WatchlistState({this.movies = const []});

  WatchlistState copyWith({List<WatchlistMovie>? movies}) {
    return WatchlistState(movies: movies ?? this.movies);
  }
}
