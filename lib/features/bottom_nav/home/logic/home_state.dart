import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';

class HomeState {
  final RequestsStatus trendingStatus;
  final RequestsStatus popularStatus;
  final RequestsStatus topRatedStatus;

  final List<MediaModel> trending;
  final List<MediaModel> popular;
  final List<MediaModel> topRated;

  final String? error;

  HomeState({
    this.trendingStatus = RequestsStatus.initial,
    this.popularStatus = RequestsStatus.initial,
    this.topRatedStatus = RequestsStatus.initial,
    this.trending = const [],
    this.popular = const [],
    this.topRated = const [],
    this.error,
  });

  HomeState copyWith({
    RequestsStatus? trendingStatus,
    RequestsStatus? popularStatus,
    RequestsStatus? topRatedStatus,
    List<MediaModel>? trending,
    List<MediaModel>? popular,
    List<MediaModel>? topRated,
    String? error,
  }) {
    return HomeState(
      trendingStatus: trendingStatus ?? this.trendingStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      trending: trending ?? this.trending,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      error: error ?? this.error,
    );
  }
}
