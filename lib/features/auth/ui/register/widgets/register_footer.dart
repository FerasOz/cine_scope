import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: ColorsManager.textSecondary,
            fontSize: 14.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.loginScreen);
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
