import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/details/data/repo/movie_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo _movieDetailsRepo;

  MovieDetailsCubit(this._movieDetailsRepo) : super(const MovieDetailsState());

  Future<void> getMovieDetails(int movieId) async {
    emit(state.copyWith(status: RequestsStatus.loading));

    final detailsResult = await _movieDetailsRepo.getMovieDetails(movieId);

    final reviewsResult = await _movieDetailsRepo.getMovieReviews(movieId);

    final castResult = await _movieDetailsRepo.getMovieCast(movieId);

    if (detailsResult.isSuccess &&
        reviewsResult.isSuccess &&
        castResult.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movieDetails: detailsResult.data,
          reviews: reviewsResult.data?.results ?? [],
          casts: castResult.data?.cast ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error:
              detailsResult.error?.errorMessage ??
              reviewsResult.error?.errorMessage ??
              castResult.error?.errorMessage,
        ),
      );
    }
  }
}
