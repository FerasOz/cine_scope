import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/details/details_screen.dart';
import 'package:cine_scope/features/home/home_screen.dart';
import 'package:cine_scope/features/search/search_screen.dart';
import 'package:cine_scope/features/watch_list/watch_list_screen.dart';
import 'package:flutter/material.dart';

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
        return MaterialPageRoute(builder: (_) => const WatchListScreen());
      default:
        return null;
    }
  }
}
