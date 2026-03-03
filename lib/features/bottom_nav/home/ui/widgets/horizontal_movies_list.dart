import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MediaModel> media;

  const HorizontalMoviesList({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: media.length,
      separatorBuilder: (_, _) => horizontalSpace(12),
      itemBuilder: (context, index) {
        final item = media[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailsScreen,
              arguments: {"id": item.id, "type": item.type},
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${item.posterPath}",
              width: 120.w,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
