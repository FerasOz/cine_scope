import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(16),
        Text(
          'Create your account',
          style: TextStyle(
            color: ColorsManager.textPrimary,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpace(8),
        Text(
          'Register now to enjoy personalized movie recommendations.',
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
