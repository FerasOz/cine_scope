import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_cubit.dart';
import 'package:cine_scope/features/cubit/app_cubit.dart';
import 'package:cine_scope/features/app_layout.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/details_screen.dart';
import 'package:cine_scope/features/bottom_nav/details/logic/movie_details_cubit.dart';
import 'package:cine_scope/features/bottom_nav/home/logic/home_cubit.dart';
import 'package:cine_scope/features/bottom_nav/home/ui/home_screen.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/search_screen.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsScreen:
        final movieId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
            child: const DetailsScreen(),
          ),
        );
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
              BlocProvider(create: (context) => getIt<SearchCubit>()),
            ],
            child: const AppLayout(),
          ),
        );
      default:
        return null;
    }
  }
}
