import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/cast_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/review_model.dart';

class MediaDetailsState {
  final RequestsStatus status;
  final MediaDetailsModel? details;
  final List<ReviewModel>? reviews;
  final List<CastModel>? casts;
  final String? error;

  const MediaDetailsState({
    this.status = RequestsStatus.initial,
    this.details,
    this.reviews,
    this.casts,
    this.error,
  });

  MediaDetailsState copyWith({
    RequestsStatus? status,
    MediaDetailsModel? details,
    List<ReviewModel>? reviews,
    List<CastModel>? casts,
    String? error,
  }) {
    return MediaDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
      reviews: reviews ?? this.reviews,
      casts: casts ?? this.casts,
      error: error ?? this.error,
    );
  }
}
