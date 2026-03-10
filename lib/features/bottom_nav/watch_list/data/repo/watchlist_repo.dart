import 'package:cine_scope/features/bottom_nav/watch_list/data/local/watchlist_local_data_source.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_model.dart';

class WatchlistRepo {
  final WatchlistLocalDataSource local;

  WatchlistRepo(this.local);

  List<WatchlistModel> getWatchlist() {
    return local.getMovies();
  }

  Future<void> toggleMovie(WatchlistModel movie) async {
    final exists = local.isMovieInWatchlist(movie.id);

    if (exists) {
      await local.removeMovie(movie.id);
    } else {
      await local.addMovie(movie);
    }
  }

  bool isSaved(int id) {
    return local.isMovieInWatchlist(id);
  }
}
