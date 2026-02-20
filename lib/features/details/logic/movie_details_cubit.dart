import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/data/repos/details_repo/movie_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo _movieDetailsRepo;

  MovieDetailsCubit(this._movieDetailsRepo) : super(const MovieDetailsState());

  Future<void> getMovieDetails(int movieId) async {
    emit(state.copyWith(status: RequestsStatus.loading));

    final result = await _movieDetailsRepo.getMovieDetails(movieId);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movieDetails: result.data!,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }
}
