import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/ui/widgets/watchlist_item.dart';
import 'package:flutter/material.dart';

class WatchlistListView extends StatelessWidget {
  final List<WatchlistMovie> movies;

  const WatchlistListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return WatchlistItem(movie: movie);
      },
    );
  }
}
