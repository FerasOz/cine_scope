import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/features/auth/data/data_source/auth_api.dart';
import 'package:cine_scope/features/auth/data/models/user_model.dart';

class AuthRepo {
  final AuthApi _api;

  AuthRepo(this._api);

  bool get hasActiveSession => _api.hasActiveSession;

  Map<String, dynamic>? getActiveSession() => _api.getActiveSession();

  Future<void> clearSession() => _api.clearSession();

  Future<ApiResult<UserModel>> login(String email, String password) async {
    try {
      final response = await _api.login(email, password);
      return ApiResult.success(UserModel.fromJson(response));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserModel>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await _api.register(name, email, password);
      return ApiResult.success(UserModel.fromJson(response));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
