import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/credits_response_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/reviews_response_model.dart';

class MovieDetailsRepo {
  final ApiService _apiService;

  MovieDetailsRepo(this._apiService);

  Future<ApiResult<MovieDetailsModel>> getMovieDetails(int movieId) async {
    try {
      final response = await _apiService.getMovieDetails(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ReviewsResponseModel>> getMovieReviews(int movieId) async {
    try {
      final response = await _apiService.getMovieReviews(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CreditsResponseModel>> getMovieCast(int movieId) async {
    try {
      final response = await _apiService.getMovieCast(movieId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
