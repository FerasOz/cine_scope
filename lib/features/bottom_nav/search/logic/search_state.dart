import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/movie_model.dart';

class SearchState {
  final RequestsStatus status;
  final List<MovieModel> movies;
  final int currentPage;
  final int totalPages;
  final String? error;

  const SearchState({
    this.status = RequestsStatus.initial,
    this.movies = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.error,
  });

  SearchState copyWith({
    RequestsStatus? status,
    List<MovieModel>? movies,
    int? currentPage,
    int? totalPages,
    String? error,
  }) {
    return SearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      error: error ?? this.error,
    );
  }
}