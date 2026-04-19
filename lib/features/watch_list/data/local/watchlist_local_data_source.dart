import 'package:cine_scope/features/watch_list/data/models/watchlist_model.dart';
import 'package:hive/hive.dart';

class WatchlistLocalDataSource {
  final Box<Map> box;

  WatchlistLocalDataSource(this.box);

  Future<void> addMovie(String userId, WatchlistModel movie) async {
    await box.put(_movieKey(userId, movie.id), movie.toJson());
  }

  Future<void> removeMovie(String userId, int id) async {
    await box.delete(_movieKey(userId, id));
  }

  List<WatchlistModel> getMovies(String userId) {
    return box.toMap().entries
        .where((entry) => entry.key.toString().startsWith('${userId}_'))
        .map((entry) => entry.value)
        .map((e) => WatchlistModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  bool isMovieInWatchlist(String userId, int id) {
    return box.containsKey(_movieKey(userId, id));
  }

  String _movieKey(String userId, int movieId) => '${userId}_$movieId';
}
