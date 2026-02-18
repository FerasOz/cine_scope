import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/data/models/movie_model.dart';

class HomeState {
  final RequestsStatus trendingStatus;
  final RequestsStatus popularStatus;
  final RequestsStatus topRatedStatus;

  final List<MovieModel> trendingMovies;
  final List<MovieModel> popularMovies;
  final List<MovieModel> topRatedMovies;

  final String? error;

  HomeState({
    this.trendingStatus = RequestsStatus.initial,
    this.popularStatus = RequestsStatus.initial,
    this.topRatedStatus = RequestsStatus.initial,
    this.trendingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.error,
  });

  HomeState copyWith({
    RequestsStatus? trendingStatus,
    RequestsStatus? popularStatus,
    RequestsStatus? topRatedStatus,
    List<MovieModel>? trendingMovies,
    List<MovieModel>? popularMovies,
    List<MovieModel>? topRatedMovies,
    String? error,
  }) {
    return HomeState(
      trendingStatus: trendingStatus ?? this.trendingStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      error: error,
    );
  }
}
