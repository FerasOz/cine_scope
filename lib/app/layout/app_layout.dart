import 'package:cine_scope/app/layout/widgets/custom_bottom_nav.dart';
import 'package:cine_scope/app/app_cubit/app_cubit.dart';
import 'package:cine_scope/app/app_cubit/app_state.dart';
import 'package:cine_scope/features/home/ui/home_screen.dart';
import 'package:cine_scope/features/profile/ui/profile_screen.dart';
import 'package:cine_scope/features/search/ui/search_screen.dart';
import 'package:cine_scope/features/watch_list/ui/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final pages = [
          const HomeScreen(),
          const SearchScreen(),
          const WatchlistScreen(),
          const ProfileScreen(),
        ];

        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: KeyedSubtree(
              key: ValueKey(state.currentIndex),
              child: pages[state.currentIndex],
            ),
          ),

          bottomNavigationBar: CustomBottomNav(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<AppCubit>().changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
