import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/auth/data/models/user_model.dart';

class AuthState {
  final RequestsStatus status;
  final UserModel? user;
  final String? error;
  final String name;
  final String email;
  final String password;
  final bool isPasswordVisible;

  const AuthState({
    this.status = RequestsStatus.initial,
    this.user,
    this.error,
    this.name = '',
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
  });

  AuthState copyWith({
    RequestsStatus? status,
    UserModel? user,
    String? error,
    String? name,
    String? email,
    String? password,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
