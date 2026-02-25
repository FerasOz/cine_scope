import 'dart:async';

import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/search/data/search_repo.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  String _currentQuery = "";
  int _currentPage = 1;

  SearchCubit(this._repo) : super(const SearchState());

  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      search(query);
    });
  }

  Future<void> search(String query) async {
    if (query.isEmpty) return;

    _currentQuery = query;

    emit(
      state.copyWith(
        status: RequestsStatus.loading,
        movies: [],
        currentPage: 1,
      ),
    );

    final result = await _repo.searchMovies(query: query, page: 1);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movies: result.data!.results,
          currentPage: result.data!.page,
          totalPages: result.data!.totalPages,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (state.currentPage >= state.totalPages) return;

    final nextPage = state.currentPage + 1;

    final result = await _repo.searchMovies(
      query: _currentQuery,
      page: nextPage,
    );

    if (result.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movies: [...state.movies, ...result.data!.results],
          currentPage: result.data!.page,
          totalPages: result.data!.totalPages,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  Future<void> searchByGenre(int genreId) async {
    emit(state.copyWith(status: RequestsStatus.loading, movies: []));

    _currentPage = 1;
    _currentQuery = "";

    final result = await _repo.getMoviesByGenre(
      genreId: genreId,
      page: _currentPage,
    );

    if (result.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          movies: result.data!.results,
          currentPage: result.data!.page,
          totalPages: result.data!.totalPages,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  void clear() {
    emit(const SearchState());
  }
}
