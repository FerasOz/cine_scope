import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int movieId;
  final String rating;
  final String year;

  const SearchResultItem({
    super.key,
    required this.imageUrl,
    required this.movieId,
    required this.title,
    required this.rating,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsScreen, arguments: movieId);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      "https://image.tmdb.org/t/p/w500$imageUrl",
                      width: 80.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 80.w,
                      height: 110.h,
                      color: Colors.grey.shade800,
                      child: const Icon(Icons.movie, color: Colors.white),
                    ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpace(6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      horizontalSpace(4),
                      Text(rating, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  verticalSpace(6),
                  Text(
                    year,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
