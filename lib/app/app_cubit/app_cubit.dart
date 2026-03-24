import 'package:cine_scope/app/app_cubit/app_state.dart';
import 'package:cine_scope/features/home/ui/home_screen.dart';
import 'package:cine_scope/features/search/ui/search_screen.dart';
import 'package:cine_scope/features/watch_list/ui/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final List<Widget> bottomScreens = const [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
  ];

  void changeBottomNav(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
