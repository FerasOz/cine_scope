import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/data/models/home_model/movie_model.dart';
import 'package:cine_scope/features/home/ui/widgets/horizontal_movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesSection extends StatelessWidget {
  final String title;
  final List<MovieModel>? movies;
  final RequestsStatus status;

  const MoviesSection({
    super.key,
    required this.title,
    required this.movies,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        verticalSpace(12),

        SizedBox(height: 180.h, child: _buildContent()),

        verticalSpace(24),
      ],
    );
  }

  Widget _buildContent() {
    if (status == RequestsStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (status == RequestsStatus.error) {
      return const Center(child: Text("Something went wrong"));
    }

    if (movies == null || movies!.isEmpty) {
      return const SizedBox();
    }

    return HorizontalMoviesList(movies: movies!);
  }
}
