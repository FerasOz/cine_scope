import 'dart:async';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';
import 'package:cine_scope/features/search/data/local/search_local_data_source.dart';
import 'package:cine_scope/features/search/data/repo/search_repo.dart';
import 'package:cine_scope/features/search/logic/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _repo;
  final SearchLocalDataSource _local;

  SearchCubit(this._repo, this._local) : super(const SearchState()) {
    loadRecent();
  }

  Timer? _debounce;
  bool _isLoadingMore = false;
  List<String> recentSearches = [];
  String query = "";

  void onSearchChanged(String query) {
    emit(state.copyWith(query: query));

    _generateSuggestions(query);
    this.query = query;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        emit(const SearchState());
        return;
      }

      _search(query);
    });
  }

  Future<void> _search(String query) async {
    if (query.trim().length < 3) return;

    emit(
      state.copyWith(
        status: RequestsStatus.loading,
        results: [],
        currentPage: 1,
      ),
    );

    final result = await _repo.search(query: query, page: 1);

    if (result.isSuccess) {
      loadRecent();

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
    if (_isLoadingMore) return;
    if (state.currentPage >= state.totalPages) return;

    _isLoadingMore = true;

    final nextPage = state.currentPage + 1;

    final result = await _repo.search(query: state.query, page: nextPage);

    if (result.isSuccess) {
      emit(
        state.copyWith(
          results: [...state.results, ...result.data!.results],
          currentPage: result.data!.page,
          totalPages: result.data!.totalPages,
        ),
      );
    }

    _isLoadingMore = false;
  }

  void onSearchSubmitted(String query) {
    if (query.trim().isEmpty) return;

    _search(query);
    _local.saveSearch(query);
    loadRecent();
  }

  Future<void> searchByGenre(int genreId) async {
    emit(state.copyWith(status: RequestsStatus.loading));

    final movie = await _repo.discoverByGenre(
      type: MediaType.movie,
      genreId: genreId,
      page: 1,
    );

    final tv = await _repo.discoverByGenre(
      type: MediaType.tv,
      genreId: genreId,
      page: 1,
    );

    if (movie.isSuccess && tv.isSuccess) {
      emit(
        state.copyWith(
          status: RequestsStatus.success,
          results: [...movie.data!.results, ...tv.data!.results],
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: "Failed to load genre",
        ),
      );
    }
  }

  void loadRecent() {
    final recent = _local.getRecentSearches();
    recentSearches = _local.getRecentSearches();
    emit(state.copyWith(recent: recent));
  }

  Future<void> clearRecent() async {
    await _local.clear();
    loadRecent();
  }

  void _generateSuggestions(String query) {
    final suggestions = state.recent
        .where((e) => e.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(suggestions: suggestions));
  }

  void clearSearch() {
    emit(const SearchState());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
