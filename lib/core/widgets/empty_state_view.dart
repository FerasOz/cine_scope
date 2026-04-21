import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.compact = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: compact ? 64.w : 82.w,
          height: compact ? 64.w : 82.w,
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.orange,
            size: compact ? 30.sp : 38.sp,
          ),
        ),
        verticalSpace(compact ? 14 : 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.textPrimary,
            fontSize: compact ? 16.sp : 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpace(8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.textSecondary,
            fontSize: compact ? 12.sp : 14.sp,
            height: 1.5.h,
          ),
        ),
      ],
    );

    if (compact) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: content,
      );
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: content,
      ),
    );
  }
}
