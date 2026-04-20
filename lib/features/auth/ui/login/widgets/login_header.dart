import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          'Welcome ...',
          style: TextStyle(
            color: ColorsManager.textPrimary,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpace(8),
        Text(
          'Sign in to explore movies and series.',
          style: TextStyle(
            color: ColorsManager.textSecondary,
            fontSize: 15.sp,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
