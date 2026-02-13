import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/watch_list/widgets/watchlist_item.dart';
import 'package:flutter/material.dart';

class WatchlistListView extends StatelessWidget {
  const WatchlistListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        WatchlistItem(
          imageUrl:
              "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
          title: "Spiderman",
          rating: "9.5",
          genre: "Action",
          year: "2019",
          duration: "139 minutes",
        ),
        verticalSpace(24),
        WatchlistItem(
          imageUrl:
              "https://image.tmdb.org/t/p/w500/5P8SmMzSNYikXpxil6BYzJ16611.jpg",
          title: "Spider-Man: No Way Home",
          rating: "8.5",
          genre: "Action",
          year: "2021",
          duration: "139 minutes",
        ),
      ],
    );
  }
}
