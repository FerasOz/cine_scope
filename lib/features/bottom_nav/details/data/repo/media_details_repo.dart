import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/credits_response_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/reviews_response_model.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';

class MediaDetailsRepo {
  final ApiService _apiService;

  MediaDetailsRepo(this._apiService);

  Future<ApiResult<MediaDetailsModel>> getDetails({
    required MediaType type,
    required int id,
  }) async {
    try {
      final response = await _apiService.getDetails(type.value, id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ReviewsResponseModel>> getReviews({
    required MediaType type,
    required int id,
  }) async {
    try {
      final response = await _apiService.getReviews(type.value, id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreditsResponseModel>> getCredits({
    required MediaType type,
    required int id,
  }) async {
    try {
      final response = await _apiService.getCredits(type.value, id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
