import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/repo/media_details_repo.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'media_details_state.dart';

class MediaDetailsCubit extends Cubit<MediaDetailsState> {
  final MediaDetailsRepo _repo;

  MediaDetailsCubit(this._repo) : super(const MediaDetailsState());

  Future<void> getDetails({required MediaType type, required int id}) async {
    emit(state.copyWith(status: RequestsStatus.loading));

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
