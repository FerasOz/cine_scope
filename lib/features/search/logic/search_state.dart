import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';

class SearchState {
  final RequestsStatus status;
  final List<MediaModel> results;
  final int currentPage;
  final int totalPages;
  final String query;
  final String? error;
  final List<String> recent;
  final List<String> suggestions;

  const SearchState({
    this.status = RequestsStatus.initial,
    this.results = const [],
    this.currentPage = 1,
    this.totalPages = 1,
    this.query = "",
    this.error,
    this.recent = const [],
    this.suggestions = const [],
  });

  SearchState copyWith({
    RequestsStatus? status,
    List<MediaModel>? results,
    int? currentPage,
    int? totalPages,
    String? query,
    String? error,
    List<String>? recent,
    List<String>? suggestions,
  }) {
    return SearchState(
      status: status ?? this.status,
      results: results ?? this.results,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      query: query ?? this.query,
      error: error ?? this.error,
      recent: recent ?? this.recent,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
