import 'package:cine_scope/core/networking/api_constants.dart';
import 'package:cine_scope/features/details/data/models/casts/cast_model.dart';
import 'package:cine_scope/features/details/data/models/casts/credits_response_model.dart';
import 'package:cine_scope/features/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/details/data/models/review/review_model.dart';
import 'package:cine_scope/features/details/data/models/review/reviews_response_model.dart';
import 'package:cine_scope/features/home/data/models/movies_response_model.dart';
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

  @GET(ApiConstants.movieDetails)
  Future<MovieDetailsModel> getMovieDetails(@Path("movie_id") int movieId);

  @GET(ApiConstants.movieReviews)
  Future<ReviewsResponseModel> getMovieReviews(@Path("movie_id") int movieId);

  @GET(ApiConstants.movieCasts)
  Future<CreditsResponseModel> getMovieCast(@Path("movie_id") int movieId);
}
