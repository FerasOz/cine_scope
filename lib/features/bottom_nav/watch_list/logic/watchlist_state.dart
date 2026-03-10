import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_model.dart';

class WatchlistState {
  final List<WatchlistModel> movies;

  const WatchlistState({this.movies = const []});

  WatchlistState copyWith({List<WatchlistModel>? movies}) {
    return WatchlistState(movies: movies ?? this.movies);
  }
}
