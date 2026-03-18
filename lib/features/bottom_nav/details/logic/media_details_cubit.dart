import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/repo/media_details_repo.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'media_details_state.dart';

class MediaDetailsCubit extends Cubit<MediaDetailsState> {
  final MediaDetailsRepo _repo;

  MediaDetailsCubit(this._repo) : super(const MediaDetailsState());

  int _reviewsPage = 1;
  bool _isLoadingMoreReviews = false;
  bool _hasMoreReviews = true;

  Future<void> getDetails({required MediaType type, required int id}) async {
    emit(state.copyWith(status: RequestsStatus.loading));

    _reviewsPage = 1;
    _hasMoreReviews = true;

    final detailsResult = await _repo.getDetails(type: type, id: id);

    final reviewsResult = await _repo.getReviews(type: type, id: id);

    final castResult = await _repo.getCredits(type: type, id: id);

    if (detailsResult.isSuccess &&
        reviewsResult.isSuccess &&
        castResult.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          details: detailsResult.data,
          reviews: reviewsResult.data?.results ?? [],
          casts: castResult.data?.cast ?? [],
          type: type,
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

  Future<void> loadMoreReviews() async {
  if (_isLoadingMoreReviews || !_hasMoreReviews) return;

  _isLoadingMoreReviews = true;

  final nextPage = _reviewsPage + 1;

  final result = await _repo.getReviews(
    type: state.type!,
    id: state.details!.id,
    page: nextPage,
  );

  if (result.isSuccess) {
    final newReviews = result.data?.results ?? [];

    _reviewsPage = nextPage;

    if (newReviews.isEmpty) {
      _hasMoreReviews = false;
    }

    emit(
      state.copyWith(
        reviews: [...?state.reviews, ...newReviews],
      ),
    );
  }

  _isLoadingMoreReviews = false;
}
}
