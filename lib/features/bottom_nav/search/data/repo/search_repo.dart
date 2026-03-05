import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/networking/api_error_handler.dart';
import 'package:cine_scope/core/networking/api_result.dart';
import 'package:cine_scope/core/networking/api_service.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/paginated_media_response.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo(this._apiService);

  Future<ApiResult<PaginatedMediaResponse>> search({
    required String query,
    int page = 1,
  }) async {
    try {
      final response = await _apiService.search(query, page);

      response.results.removeWhere((item) => item.title.isEmpty);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<PaginatedMediaResponse>> discoverByGenre({
    required MediaType type,
    required int genreId,
    required int page,
  }) async {
    try {
      final response = await _apiService.discoverByGenre(
        type.value,
        genreId,
        page,
      );

      for (var item in response.results) {
        item.type = type;
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
