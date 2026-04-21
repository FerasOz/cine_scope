import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/watch_list/data/repo/watchlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/features/watch_list/data/models/watchlist_model.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo repo;

  WatchlistCubit(this.repo) : super(const WatchlistState());

  Future<void> loadWatchlist() async {
    emit(state.copyWith(status: RequestsStatus.loading, error: null));

    try {
      final movies = repo.getWatchlist();
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movies: movies,
          error: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: 'Unable to load your watch list right now.',
        ),
      );
    }
  }

  Future<void> toggleMovie(WatchlistModel movie) async {
    await repo.toggleMovie(movie);

    final updatedMovies = repo.getWatchlist();

    emit(
      state.copyWith(
        status: RequestsStatus.success,
        movies: updatedMovies,
        error: null,
      ),
    );
  }

  bool isSaved(int id) {
    return repo.isSaved(id);
  }
}
