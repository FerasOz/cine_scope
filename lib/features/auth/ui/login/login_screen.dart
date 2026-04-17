import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/cubit/auth_cubit.dart';
import 'package:cine_scope/features/auth/cubit/auth_state.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: ColorsManager.textSecondary),
      prefixIcon: Icon(icon, color: ColorsManager.textSecondary),
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == RequestsStatus.error && state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.redAccent,
              ),
            );
          }

          if (state.status == RequestsStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login successful'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, Routes.appLayout);
          }
        },
        builder: (context, state) {
          final isLoading = state.status == RequestsStatus.loading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
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
                  verticalSpace(32),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 28.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF242424),
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login to your account',
                          style: TextStyle(
                            color: ColorsManager.textPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpace(24),
                        TextField(
                          onChanged: cubit.setEmail,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            hint: 'Email address',
                            icon: Icons.email_outlined,
                          ),
                        ),
                        verticalSpace(16),
                        TextField(
                          onChanged: cubit.setPassword,
                          obscureText: !state.isPasswordVisible,
                          style: const TextStyle(color: Colors.white),
                          decoration:
                              _inputDecoration(
                                hint: 'Password',
                                icon: Icons.lock_outline,
                              ).copyWith(
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
                            onPressed: isLoading ? null : cubit.login,
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : Text(
                                    'Sign In',
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
                  ),
                  verticalSpace(28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          color: ColorsManager.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registerScreen);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
