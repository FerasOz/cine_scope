import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/search/ui/widgets/genre_chip.dart';
import 'package:cine_scope/features/search/ui/widgets/search_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
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
          verticalSpace(30),
          Text(
            "Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(12),
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
