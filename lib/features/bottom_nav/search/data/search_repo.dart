import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/paginated_movies_response.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo(this._apiService);

  Future<ApiResult<PaginatedMoviesResponse>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    try {
      final response = await _apiService.searchMovies(query, page);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PaginatedMoviesResponse>> getMoviesByGenre({
    required int genreId,
    required int page,
  }) async {
    try {
      final response = await _apiService.getMoviesByGenre(genreId, page);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PaginatedMoviesResponse>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrendingMovies();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
