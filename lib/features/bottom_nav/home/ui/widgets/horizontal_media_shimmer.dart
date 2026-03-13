import 'package:cine_scope/features/bottom_nav/home/ui/widgets/media_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalMediaShimmer extends StatelessWidget {
  const HorizontalMediaShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (_, _) => SizedBox(width: 12.w),
      itemBuilder: (_, _) => const MediaItemShimmer(),
    );
  }
}
