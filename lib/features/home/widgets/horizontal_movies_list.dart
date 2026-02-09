import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
    
class HorizontalMoviesList extends StatelessWidget {
  const HorizontalMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (_, _) => horizontalSpace(12),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
            width: 120.w,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}