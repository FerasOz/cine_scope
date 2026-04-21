import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/watch_list/data/models/watchlist_model.dart';

class WatchlistState {
  static const _sentinel = Object();

  final RequestsStatus status;
  final List<WatchlistModel> movies;
  final String? error;

  const WatchlistState({
    this.status = RequestsStatus.initial,
    this.movies = const [],
    this.error,
  });

  WatchlistState copyWith({
    RequestsStatus? status,
    List<WatchlistModel>? movies,
    Object? error = _sentinel,
  }) {
    return WatchlistState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      error: identical(error, _sentinel) ? this.error : error as String?,
    );
  }
}
