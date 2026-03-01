import 'package:cine_scope/features/bottom_nav/watch_list/data/repo/watchlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo repo;

  WatchlistCubit(this.repo) : super(const WatchlistState());

  void loadWatchlist() {
    final movies = repo.getWatchlist();
    emit(state.copyWith(movies: movies));
  }

  Future<void> toggleMovie(WatchlistMovie movie) async {
    await repo.toggleMovie(movie);

    final updatedMovies = repo.getWatchlist();

    emit(state.copyWith(movies: updatedMovies));
  }

  bool isSaved(int id) {
    return repo.isSaved(id);
  }
}
