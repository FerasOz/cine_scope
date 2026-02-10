import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      decoration: BoxDecoration(color: ColorsManager.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icon(
              Icons.home,
              color: currentIndex == 0
                  ? ColorsManager.textSecondary
                  : ColorsManager.textPrimary,
            ),
            screenName: 'Home',
            isActive: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _buildNavItem(
            context,
            icon: Icon(
              Icons.search,
              color: currentIndex == 1
                  ? ColorsManager.textSecondary
                  : ColorsManager.textPrimary,
            ),
            screenName: 'Search',
            isActive: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _buildNavItem(
            context,
            icon: Icon(
              Icons.bookmark_outline,
              color: currentIndex == 2
                  ? ColorsManager.textSecondary
                  : ColorsManager.textPrimary,
            ),
            screenName: 'Watch List',
            isActive: currentIndex == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required Icon icon,
    required String screenName,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isActive
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Column(
                      children: [
                        icon,
                        horizontalSpace(4),
                        Text(
                          screenName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorsManager.textSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                : icon,
          ],
        ),
      ),
    );
  }
}
