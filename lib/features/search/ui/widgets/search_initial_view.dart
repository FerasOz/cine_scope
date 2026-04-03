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

    if (recent.isEmpty) {
      return const Center(
        child: Text(
          "Start searching ...",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header + Clear
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Searches",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              TextButton(
                onPressed: () {
                  context.read<SearchCubit>().clearRecent();
                },
                child: const Text(
                  "Clear",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),

          verticalSpace(12),

          /// List
          ...recent.map(
            (query) => ListTile(
              title: Text(query, style: const TextStyle(color: Colors.white)),
              leading: const Icon(Icons.history, color: Colors.grey),
              onTap: () {
                context.read<SearchCubit>().onSearchChanged(query);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class SearchInitialView extends StatelessWidget {
//   const SearchInitialView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final searchCubit = context.read<SearchCubit>();

//     final genres = GenreConstants.genres;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Genres",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           verticalSpace(12),

//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: genres.entries.map((genre) {
//               return GenreChip(
//                 title: genre.value,
//                 onTap: () {
//                   searchCubit.searchByGenre(genre.key);
//                 },
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
