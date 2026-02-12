import 'package:cine_scope/features/search/widgets/genre_chip.dart';
import 'package:cine_scope/features/search/widgets/search_chip.dart';
import 'package:flutter/material.dart';
    
class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Trending",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              SearchChip(title: "Spider-Man"),
              SearchChip(title: "Dune"),
              SearchChip(title: "Oppenheimer"),
              SearchChip(title: "Breaking Bad"),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              GenreChip(title: "Action"),
              GenreChip(title: "Drama"),
              GenreChip(title: "Sci-Fi"),
              GenreChip(title: "Comedy"),
            ],
          ),
        ],
      ),
    );
  }
}