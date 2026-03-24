import 'package:cine_scope/core/helpers/constants.dart';

class AppState {
  final RequestsStatus changeBottomNavStatus;
  final int currentIndex;
  final String? error;

  AppState({
    this.error,
    this.changeBottomNavStatus = RequestsStatus.initial,
    this.currentIndex = 0,
  });

  AppState copyWith({
    RequestsStatus? changeBottomNavStatus,
    String? error,
    int? currentIndex,
  }) {
    return AppState(
      changeBottomNavStatus:
          changeBottomNavStatus ?? this.changeBottomNavStatus,
      error: error ?? this.error,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
