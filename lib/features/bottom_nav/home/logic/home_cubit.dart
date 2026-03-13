import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:cine_scope/features/bottom_nav/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState());

  int trendingPage = 1;
  int popularPage = 1;
  int topRatedPage = 1;

  Future<void> loadMore() async {
    trendingPage++;
    popularPage++;
    topRatedPage++;

    await getTrending(state.currentType, page: trendingPage);
    await getPopular(state.currentType, page: popularPage);
    await getTopRated(state.currentType, page: topRatedPage);
  }

  Future<void> loadHomeData({MediaType? type}) async {
    final newType = type ?? state.currentType;

    await Future.wait([
      getTrending(newType),
      getPopular(newType),
      getTopRated(newType),
    ]);
  }

  void changeType(MediaType type) {
    if (state.currentType == type) return;

    trendingPage = 1;
    popularPage = 1;
    topRatedPage = 1;

    emit(
      state.copyWith(
        currentType: type,
        trending: [],
        popular: [],
        topRated: [],
      ),
    );

    loadHomeData(type: type);
  }

  Future<void> getTrending(MediaType type, {int page = 1}) async {
    emit(state.copyWith(trendingStatus: RequestsStatus.loading));

    final result = await _homeRepo.getTrending(type: type, page: page);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          trendingStatus: RequestsStatus.success,
          trending: result.data!,
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

  Future<void> getPopular(MediaType type, {int page = 1}) async {
    emit(state.copyWith(popularStatus: RequestsStatus.loading));

    final result = await _homeRepo.getPopular(type: type, page: page);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          popularStatus: RequestsStatus.success,
          popular: result.data!,
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

  Future<void> getTopRated(MediaType type, {int page = 1}) async {
    emit(state.copyWith(topRatedStatus: RequestsStatus.loading));

    final result = await _homeRepo.getTopRated(type: type, page: page);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          topRatedStatus: RequestsStatus.success,
          topRated: result.data!,
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
