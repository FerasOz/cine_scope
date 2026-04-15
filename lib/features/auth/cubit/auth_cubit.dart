import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/auth/cubit/auth_state.dart';
import 'package:cine_scope/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;

  AuthCubit(this.repo) : super(const AuthState());

  void setEmail(String email) {
    emit(state.copyWith(email: email, error: null));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password, error: null));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> login() async {
    if (state.email.trim().isEmpty || state.password.trim().isEmpty) {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: 'Email and password are required.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RequestsStatus.loading, error: null));

    final result = await repo.login(state.email.trim(), state.password.trim());

    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(status: RequestsStatus.success, user: result.data));
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(state.copyWith(status: RequestsStatus.loading));

    final result = await repo.register(name, email, password);

    if (result.isSuccess && result.data != null) {
      emit(state.copyWith(status: RequestsStatus.success, user: result.data));
    } else {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: result.error?.errorMessage,
        ),
      );
    }
  }
}
