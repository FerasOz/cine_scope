import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/cubit/app_cubit.dart';
import 'package:cine_scope/features/app_layout.dart';
import 'package:cine_scope/features/details/details_screen.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/home/ui/home_screen.dart';
import 'package:cine_scope/features/search/search_screen.dart';
import 'package:cine_scope/features/watch_list/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.watchListScreen:
        return MaterialPageRoute(builder: (_) => const WatchlistScreen());
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AppCubit()),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()..loadHomeData(),
              ),
            ],
            child: const AppLayout(),
          ),
        );
      default:
        return null;
    }
  }
}
