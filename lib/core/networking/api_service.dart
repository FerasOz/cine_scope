import 'package:cine_scope/core/networking/api_constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/credits_response_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/reviews_response_model.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/paginated_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.trendingMovies)
  Future<PaginatedMoviesResponse> getTrendingMovies();

  @GET(ApiConstants.popularMovies)
  Future<PaginatedMoviesResponse> getPopularMovies();

  @GET(ApiConstants.topRatedMovies)
  Future<PaginatedMoviesResponse> getTopRatedMovies();

  @GET(ApiConstants.movieDetails)
  Future<MovieDetailsModel> getMovieDetails(@Path("movie_id") int movieId);

  @GET(ApiConstants.movieReviews)
  Future<ReviewsResponseModel> getMovieReviews(@Path("movie_id") int movieId);

  @GET(ApiConstants.movieCasts)
  Future<CreditsResponseModel> getMovieCast(@Path("movie_id") int movieId);

  @GET(ApiConstants.searchMovies)
  Future<PaginatedMoviesResponse> searchMovies(
    @Query("query") String query,
    @Query("page") int page,
  );

    @GET(ApiConstants.genrehMovies)
  Future<PaginatedMoviesResponse> getMoviesByGenre(
    @Query("with_genres") int genreId,
    @Query("page") int page,
  );

}
