import 'package:cine_scope/core/helpers/genre_constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_cubit.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/genre_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    final genres = GenreConstants.genres;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              return GenreChip(
                title: genre.value,
                onTap: () {
                  searchCubit.searchByGenre(genre.key);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
