import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchlistShimmer extends StatelessWidget {
  const WatchlistShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: 6,
      separatorBuilder: (_, _) => SizedBox(height: 14.h),
      itemBuilder: (_, _) {
        return Shimmer.fromColors(
          baseColor: const Color(0xFF2B2B2B),
          highlightColor: const Color(0xFF3A3A3A),
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: const Color(0xFF242424),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        );
      },
    );
  }
}
