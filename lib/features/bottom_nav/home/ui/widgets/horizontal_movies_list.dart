import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const HorizontalMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      separatorBuilder: (_, _) => horizontalSpace(12),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailsScreen,
              arguments: movie.id,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
