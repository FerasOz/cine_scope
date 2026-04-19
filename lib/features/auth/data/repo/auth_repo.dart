import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/features/auth/data/data_source/auth_api.dart';
import 'package:cine_scope/features/auth/data/data_source/auth_session_local_data_source.dart';
import 'package:cine_scope/features/auth/data/models/user_model.dart';

class AuthRepo {
  final AuthApi _api;
  final AuthSessionLocalDataSource _sessionLocalDataSource;

  AuthRepo(this._api, this._sessionLocalDataSource);

  bool get hasActiveSession => _sessionLocalDataSource.hasActiveSession;

  Map<String, dynamic>? getActiveSession() =>
      _sessionLocalDataSource.getActiveSession();

  String? get currentUserId => getActiveSession()?['id']?.toString();

  Future<void> clearSession() => _sessionLocalDataSource.clearSession();

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
