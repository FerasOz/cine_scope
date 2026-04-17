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

  void setName(String name) {
    emit(state.copyWith(name: name, error: null));
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

  Future<void> register() async {
    if (state.name.trim().isEmpty ||
        state.email.trim().isEmpty ||
        state.password.trim().isEmpty) {
      emit(
        state.copyWith(
          status: RequestsStatus.error,
          error: 'Name, email and password are required.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RequestsStatus.loading, error: null));

    final result = await repo.register(
      state.name.trim(),
      state.email.trim(),
      state.password.trim(),
    );

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
