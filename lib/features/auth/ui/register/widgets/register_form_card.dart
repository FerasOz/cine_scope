import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/cubit/auth_cubit.dart';
import 'package:cine_scope/features/auth/cubit/auth_state.dart';
import 'package:cine_scope/features/auth/ui/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterFormCard extends StatelessWidget {
  const RegisterFormCard({
    super.key,
    required this.cubit,
    required this.state,
    required this.isLoading,
  });

  final AuthCubit cubit;
  final AuthState state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Register',
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          verticalSpace(24),
          AuthInputField(
            hint: 'Full name',
            icon: Icons.person_outline,
            onChanged: cubit.setName,
          ),
          verticalSpace(16),
          AuthInputField(
            hint: 'Email address',
            icon: Icons.email_outlined,
            onChanged: cubit.setEmail,
          ),
          verticalSpace(16),
          AuthInputField(
            hint: 'Password',
            icon: Icons.lock_outline,
            onChanged: cubit.setPassword,
            obscureText: !state.isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: ColorsManager.textSecondary,
              ),
              onPressed: cubit.togglePasswordVisibility,
            ),
          ),
          verticalSpace(24),
          SizedBox(
            height: 52.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: isLoading ? null : cubit.register,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  : Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
          if (state.error != null) ...[
            verticalSpace(16),
            Text(
              state.error!,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
