import 'dart:async';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:cine_scope/features/bottom_nav/search/data/repo/search_repo.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;

  String _currentQuery = "";
  int _currentPage = 1;
  MediaType _currentType = MediaType.movie;

  SearchCubit(this._repo) : super(const SearchState());

  Timer? _debounce;

  MediaType get currentType => _currentType;

  void changeType(MediaType type) {
    _currentType = type;
    clear();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      search(query);
    });
  }

  Future<void> search(String query) async {
    
    if (query.trim().length < 3) {
      emit(const SearchState());
      return;
    }

    _currentQuery = query;
    _currentPage = 1;

    emit(
      state.copyWith(
        status: RequestsStatus.loading,
        results: [],
        currentPage: 1,
      ),
    );

    final result = await _repo.search(query: query, page: 1);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          results: result.data!.results,
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

    final result = await _repo.search(query: _currentQuery, page: nextPage);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          results: [...state.results, ...result.data!.results],
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
    emit(state.copyWith(status: RequestsStatus.loading));

    final movieResult = await _repo.discoverByGenre(
      type: MediaType.movie,
      genreId: genreId,
      page: 1,
    );

    final tvResult = await _repo.discoverByGenre(
      type: MediaType.tv,
      genreId: genreId,
      page: 1,
    );

    if (movieResult.isSuccess && tvResult.isSuccess) {
      final results = [...movieResult.data!.results, ...tvResult.data!.results];

      emit(state.copyWith(status: RequestsStatus.success, results: results));
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: "Failed to load genre",
        ),
      );
    }
  }

  void clear() {
    emit(const SearchState());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
