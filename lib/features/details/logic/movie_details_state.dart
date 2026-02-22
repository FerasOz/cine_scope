import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/details/data/models/movie_details_model.dart';

class MovieDetailsState {
  final RequestsStatus status;
  final MovieDetailsModel? movieDetails;
  final String? error;

  const MovieDetailsState({
    this.status = RequestsStatus.initial,
    this.movieDetails,
    this.error,
  });

  MovieDetailsState copyWith({
    RequestsStatus? status,
    MovieDetailsModel? movieDetails,
    String? error,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movieDetails: movieDetails ?? this.movieDetails,
      error: error,
    );
  }
}