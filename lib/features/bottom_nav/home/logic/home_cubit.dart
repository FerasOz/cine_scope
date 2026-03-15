import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/home/data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState());

  int _popularPage = 1;
  bool _isLoadingMore = false;

  Future<void> loadHomeData({MediaType? type}) async {
    final newType = type ?? state.currentType;

    emit(
      state.copyWith(
        trendingStatus: RequestsStatus.loading,
        popularStatus: RequestsStatus.loading,
        topRatedStatus: RequestsStatus.loading,
      ),
    );

    final results = await Future.wait([
      _homeRepo.getTrending(type: newType),
      _homeRepo.getPopular(type: newType),
      _homeRepo.getTopRated(type: newType),
    ]);

    final trendingResult = results[0];
    final popularResult = results[1];
    final topRatedResult = results[2];

    emit(
      state.copyWith(
        currentType: newType,

        trendingStatus: trendingResult.isSuccess
            ? RequestsStatus.success
            : RequestsStatus.error,

        popularStatus: popularResult.isSuccess
            ? RequestsStatus.success
            : RequestsStatus.error,

        topRatedStatus: topRatedResult.isSuccess
            ? RequestsStatus.success
            : RequestsStatus.error,

        trending: trendingResult.data ?? [],
        popular: popularResult.data ?? [],
        topRated: topRatedResult.data ?? [],

        error:
            trendingResult.error?.errorMessage ??
            popularResult.error?.errorMessage ??
            topRatedResult.error?.errorMessage,
      ),
    );
  }

  /// PAGINATION (POPULAR ONLY)
  Future<void> loadMorePopular() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;

    final nextPage = _popularPage + 1;

    final result = await _homeRepo.getPopular(
      type: state.currentType,
      page: nextPage,
    );

    if (result.isSuccess) {
      _popularPage = nextPage;

      emit(state.copyWith(popular: [...state.popular, ...result.data!]));
    }

    _isLoadingMore = false;
  }

  void changeType(MediaType type) {
    if (state.currentType == type) return;

    _popularPage = 1;

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
}
