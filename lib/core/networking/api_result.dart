import 'api_error_model.dart';

class ApiResult<T> {
  final T? data;
  final ApiErrorModel? error;

  const ApiResult._({this.data, this.error});

  factory ApiResult.success(T data) {
    return ApiResult._(data: data);
  }

  factory ApiResult.failure(ApiErrorModel error) {
    return ApiResult._(error: error);
  }

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}
