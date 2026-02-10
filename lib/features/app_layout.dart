import 'package:cine_scope/core/widgets/custom_bottom_nav.dart';
import 'package:cine_scope/cubit/app_cubit.dart';
import 'package:cine_scope/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = context.watch<AppCubit>();
        return Scaffold(
          body: appCubit.bottomScreens[appCubit.currentIndex],
          bottomNavigationBar: CustomBottomNav(
            currentIndex: appCubit.currentIndex,
            onTap: (index) {
              appCubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
