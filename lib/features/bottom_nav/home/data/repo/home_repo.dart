import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:cine_scope/core/helpers/constants.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<MediaModel>>> getTrending({
    required MediaType type,
    String timeWindow = "day",
    int page = 1,
  }) async {
    try {
      final response = await _apiService.getTrending(type.value, timeWindow, page);

      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));    }
  }

  Future<ApiResult<List<MediaModel>>> getPopular({
    required MediaType type,
    int page = 1,
  }) async {
    try {
      final response = await _apiService.getPopular(type.value, page);

      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<MediaModel>>> getTopRated({
    required MediaType type,
    int page = 1,
  }) async {
    try {
      final response = await _apiService.getTopRated(type.value, page);

      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
