import 'package:cine_scope/core/helpers/genre_constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();
    final recent = cubit.recentSearches;
    final genres = GenreConstants.genres;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recent.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Searches",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                TextButton(
                  onPressed: () {
                    cubit.clearRecent();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),

            verticalSpace(12),

            ...recent.map(
              (query) => ListTile(
                title: Text(query, style: const TextStyle(color: Colors.white)),
                leading: const Icon(Icons.history, color: Colors.grey),
                onTap: () {
                  cubit.onSearchChanged(query);
                },
              ),
            ),

            verticalSpace(24),
          ],
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
            children: genres.entries.map((genre) {
              return GestureDetector(
                onTap: () {
                  cubit.searchByGenre(genre.key);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    genre.value,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
