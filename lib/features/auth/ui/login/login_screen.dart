import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/cubit/auth_cubit.dart';
import 'package:cine_scope/features/auth/cubit/auth_state.dart';
import 'package:cine_scope/features/auth/ui/login/widgets/login_footer.dart';
import 'package:cine_scope/features/auth/ui/login/widgets/login_form_card.dart';
import 'package:cine_scope/features/auth/ui/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  const LoginHeader(),
                  verticalSpace(32),
                  LoginFormCard(
                    cubit: cubit,
                    state: state,
                    isLoading: isLoading,
                  ),
                  verticalSpace(28),
                  const LoginFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
