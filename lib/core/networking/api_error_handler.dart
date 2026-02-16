import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            statusMessage: "Connection timeout with the server",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(statusMessage: "Send timeout with the server");

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            statusMessage: "Receive timeout from the server",
          );

        case DioExceptionType.cancel:
          return ApiErrorModel(
            statusMessage: "Request to server was cancelled",
          );

        case DioExceptionType.connectionError:
          return ApiErrorModel(statusMessage: "No internet connection");

        case DioExceptionType.badCertificate:
          return ApiErrorModel(statusMessage: "Bad SSL certificate");

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response?.data);

        case DioExceptionType.unknown:
        default:
          return ApiErrorModel(statusMessage: "Unexpected error occurred");
      }
    } else {
      return ApiErrorModel(statusMessage: "Something went wrong");
    }
  }

  static ApiErrorModel _handleBadResponse(dynamic data) {
    if (data is Map<String, dynamic>) {
      return ApiErrorModel.fromJson(data);
    } else {
      return ApiErrorModel(statusMessage: "Unknown server error");
    }
  }
}
