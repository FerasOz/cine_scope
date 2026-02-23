import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/cast_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/review_model.dart';

class MovieDetailsState {
  final RequestsStatus status;
  final MovieDetailsModel? movieDetails;
    final List<ReviewModel>? reviews;
  final List<CastModel>? casts;
  final String? error;

  const MovieDetailsState({
    this.status = RequestsStatus.initial,
    this.movieDetails,
    this.reviews,
    this.casts,
    this.error,
  });

  MovieDetailsState copyWith({
    RequestsStatus? status,
    MovieDetailsModel? movieDetails,
    List<ReviewModel>? reviews,
    List<CastModel>? casts,
    String? error,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movieDetails: movieDetails ?? this.movieDetails,
      reviews: reviews ?? this.reviews,
      casts: casts ?? this.casts,
      error: error,
    );
  }
}