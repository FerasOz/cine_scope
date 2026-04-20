import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/auth/cubit/auth_cubit.dart';
import 'package:cine_scope/features/auth/cubit/auth_state.dart';
import 'package:cine_scope/features/auth/ui/register/widgets/register_footer.dart';
import 'package:cine_scope/features/auth/ui/register/widgets/register_form_card.dart';
import 'package:cine_scope/features/auth/ui/register/widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
                content: Text('Registration successful'),
                backgroundColor: Colors.green,
              ),
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted) return;
              Navigator.pushReplacementNamed(context, Routes.appLayout);
            });
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
                  const RegisterHeader(),
                  verticalSpace(32),
                  RegisterFormCard(
                    cubit: cubit,
                    state: state,
                    isLoading: isLoading,
                  ),
                  verticalSpace(28),
                  const RegisterFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
