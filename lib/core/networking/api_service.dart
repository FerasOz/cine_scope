import 'package:cine_scope/core/networking/api_constants.dart';
import 'package:cine_scope/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.trendingMovies)
  Future<MoviesResponseModel> getTrendingMovies();

  @GET(ApiConstants.popularMovies)
  Future<MoviesResponseModel> getPopularMovies();

  @GET(ApiConstants.topRatedMovies)
  Future<MoviesResponseModel> getTopRatedMovies();
}
