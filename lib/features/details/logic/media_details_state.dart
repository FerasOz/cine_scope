import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/details/data/models/casts/cast_model.dart';
import 'package:cine_scope/features/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/details/data/models/review/review_model.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';

class MediaDetailsState {
  final RequestsStatus status;
  final MediaDetailsModel? details;
  final List<ReviewModel>? reviews;
  final List<CastModel>? casts;
  final bool isLoadingMoreReviews;
  final bool hasMoreReviews;
  final int? id;
  final MediaType? type;
  final String? error;

  const MediaDetailsState({
    this.status = RequestsStatus.initial,
    this.details,
    this.reviews,
    this.casts,
    this.isLoadingMoreReviews = false,
    this.hasMoreReviews = true,
    this.id,
    this.type,
    this.error,
  });

  MediaDetailsState copyWith({
    RequestsStatus? status,
    MediaDetailsModel? details,
    List<ReviewModel>? reviews,
    List<CastModel>? casts,
    bool? isLoadingMoreReviews,
    bool? hasMoreReviews,
    int? id,
    MediaType? type,
    String? error,
  }) {
    return MediaDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
      reviews: reviews ?? this.reviews,
      casts: casts ?? this.casts,
      isLoadingMoreReviews: isLoadingMoreReviews ?? this.isLoadingMoreReviews,
      hasMoreReviews: hasMoreReviews ?? this.hasMoreReviews,
      id: id ?? this.id,
      type: type ?? this.type,
      error: error ?? this.error,
    );
  }
}
