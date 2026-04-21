import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final bool compact;
  final String title;

  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.compact = false,
    this.title = 'Something went wrong',
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: compact ? 64.w : 84.w,
          height: compact ? 64.w : 84.w,
          decoration: BoxDecoration(
            color: Colors.redAccent.withValues(alpha: 0.14),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.error_outline_rounded,
            color: Colors.redAccent,
            size: compact ? 30.sp : 40.sp,
          ),
        ),
        verticalSpace(compact ? 14 : 18),
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
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.textSecondary,
            fontSize: compact ? 12.sp : 14.sp,
            height: 1.5,
          ),
        ),
        if (onRetry != null) ...[
          verticalSpace(compact ? 18 : 24),
          ElevatedButton.icon(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 16.w : 20.w,
                vertical: compact ? 12.h : 14.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try Again'),
          ),
        ],
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
        padding: EdgeInsets.all(24.w),
        child: content,
      ),
    );
  }
}
