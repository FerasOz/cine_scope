import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/data/models/details_model/movie_details_model.dart';

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
}
