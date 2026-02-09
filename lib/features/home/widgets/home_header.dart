import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
    
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CineScope",
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.textPrimary,
            ),
          ),
          verticalSpace(4),
          Text(
            "Discover movies & series",
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsManager.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}