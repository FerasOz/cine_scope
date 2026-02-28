import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';
import 'package:hive/hive.dart';

class WatchlistLocalDataSource {
  final Box<Map> box;

  WatchlistLocalDataSource(this.box);

  Future<void> addMovie(WatchlistMovie movie) async {
    await box.put(movie.id, movie.toJson());
  }

  Future<void> removeMovie(int id) async {
    await box.delete(id);
  }

  List<WatchlistMovie> getMovies() {
    return box.values
        .map((e) => WatchlistMovie.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  bool isMovieInWatchlist(int id) {
    return box.containsKey(id);
  }
}
