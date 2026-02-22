import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/cubit/app_state.dart';
import 'package:cine_scope/features/home/ui/home_screen.dart';
import 'package:cine_scope/features/search/ui/search_screen.dart';
import 'package:cine_scope/features/watch_list/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(state.copyWith(changeBottomNavStatus: RequestsStatus.success));
  }
}
