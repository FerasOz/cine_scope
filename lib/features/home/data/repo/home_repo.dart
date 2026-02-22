import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/home/data/models/movie_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<List<MovieModel>>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrendingMovies();
      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await _apiService.getPopularMovies();
      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<MovieModel>>> getTopRatedMovies() async {
    try {
      final response = await _apiService.getTopRatedMovies();
      return ApiResult.success(response.results);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
