import 'package:cine_scope/core/helpers/constants.dart';

class AppState {
  final RequestsStatus changeBottomNavStatus;
  final String? error;

  AppState({this.error, this.changeBottomNavStatus = RequestsStatus.initial});

  AppState copyWith({RequestsStatus? changeBottomNavStatus, String? error}) {
    return AppState(
      changeBottomNavStatus:
          changeBottomNavStatus ?? this.changeBottomNavStatus,
      error: error ?? this.error,
    );
  }
}
