import 'package:cine_scope/data/repos/home_repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState());

  /// Load all home data (Trending + Popular + Top Rated)
  Future<void> loadHomeData() async {
    await Future.wait([
      getTrendingMovies(),
      getPopularMovies(),
      getTopRatedMovies(),
    ]);
  }

  /// Trending Movies
  Future<void> getTrendingMovies() async {
    emit(state.copyWith(trendingStatus: RequestsStatus.loading));

    final result = await _homeRepo.getTrendingMovies();

    if (result.isSuccess) {
      emit(
        state.copyWith(
          trendingStatus: RequestsStatus.success,
          trendingMovies: result.data!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          trendingStatus: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  /// Popular Movies
  Future<void> getPopularMovies() async {
    emit(state.copyWith(popularStatus: RequestsStatus.loading));

    final result = await _homeRepo.getPopularMovies();

    if (result.isSuccess) {
      emit(
        state.copyWith(
          popularStatus: RequestsStatus.success,
          popularMovies: result.data!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          popularStatus: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  /// Top Rated Movies
  Future<void> getTopRatedMovies() async {
    emit(state.copyWith(topRatedStatus: RequestsStatus.loading));

    final result = await _homeRepo.getTopRatedMovies();

    if (result.isSuccess) {
      emit(
        state.copyWith(
          topRatedStatus: RequestsStatus.success,
          topRatedMovies: result.data!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          topRatedStatus: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }
}
