import 'package:cine_scope/features/auth/data/repo/auth_repo.dart';
import 'package:cine_scope/features/watch_list/data/local/watchlist_local_data_source.dart';
import 'package:cine_scope/features/watch_list/data/models/watchlist_model.dart';

class WatchlistRepo {
  final WatchlistLocalDataSource local;
  final AuthRepo authRepo;

  WatchlistRepo(this.local, this.authRepo);

  List<WatchlistModel> getWatchlist() {
    final userId = authRepo.currentUserId;
    if (userId == null) return [];

    return local.getMovies(userId);
  }

  Future<void> toggleMovie(WatchlistModel movie) async {
    final userId = authRepo.currentUserId;
    if (userId == null) return;

    final exists = local.isMovieInWatchlist(userId, movie.id);

    if (exists) {
      await local.removeMovie(userId, movie.id);
    } else {
      await local.addMovie(userId, movie);
    }
  }

  bool isSaved(int id) {
    final userId = authRepo.currentUserId;
    if (userId == null) return false;

    return local.isMovieInWatchlist(userId, id);
  }
}
