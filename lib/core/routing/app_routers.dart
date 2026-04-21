import 'package:cine_scope/core/di/dependency_injection.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/auth/cubit/auth_cubit.dart';
import 'package:cine_scope/features/auth/ui/login/login_screen.dart';
import 'package:cine_scope/features/auth/ui/register/register_screen.dart';
import 'package:cine_scope/features/details/logic/media_details_cubit.dart';
import 'package:cine_scope/features/details/ui/details_screen.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/home/ui/home_screen.dart';
import 'package:cine_scope/features/search/logic/search_cubit.dart';
import 'package:cine_scope/features/search/ui/search_screen.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_cubit.dart';
import 'package:cine_scope/features/watch_list/ui/watchlist_screen.dart';
import 'package:cine_scope/app/layout/app_layout.dart';
import 'package:cine_scope/app/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouters {
  WatchlistCubit watchlistCubit = getIt<WatchlistCubit>();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return _buildRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.homeScreen:
        return _buildRoute(builder: (_) => const HomeScreen());

      case Routes.detailsScreen:
        final args = settings.arguments as Map;
        final int id = args['id'];
        final MediaType type = args['type'];
        final String? heroImagePath = args['heroImagePath'] as String?;
        final String heroTag =
            (args['heroTag'] as String?) ?? 'media_${type.name}_$id';

        return _buildRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt<MediaDetailsCubit>()..getDetails(type: type, id: id),
              ),
              BlocProvider.value(value: watchlistCubit),
            ],
            child: DetailsScreen(
              heroTag: heroTag,
              heroImagePath: heroImagePath,
            ),
          ),
        );

      case Routes.searchScreen:
        return _buildRoute(builder: (_) => const SearchScreen());

      case Routes.watchListScreen:
        return _buildRoute(builder: (_) => const WatchlistScreen());

      case Routes.appLayout:
        return _buildRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppCubit()),
              BlocProvider(create: (_) => getIt<HomeCubit>()..loadHomeData()),
              BlocProvider(create: (_) => getIt<SearchCubit>()..loadRecent()),
              BlocProvider.value(value: watchlistCubit..loadWatchlist()),
            ],
            child: const AppLayout(),
          ),
        );

      default:
        return null;
    }
  }

  PageRouteBuilder<dynamic> _buildRoute({
    required WidgetBuilder builder,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.035),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 340),
      reverseTransitionDuration: const Duration(milliseconds: 260),
    );
  }
}
