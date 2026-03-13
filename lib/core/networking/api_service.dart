import 'package:cine_scope/core/networking/api_constants.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/casts/credits_response_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/review/reviews_response_model.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/paginated_media_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  /// Trending
  @GET(ApiConstants.trending)
  Future<PaginatedMediaResponse> getTrending(
    @Path("media_type") String mediaType, // movie | tv
    @Path("time_window") String timeWindow, // day | week
    @Query("page") int page,
  );

  /// Popular
  @GET(ApiConstants.popular)
  Future<PaginatedMediaResponse> getPopular(
    @Path("media_type") String mediaType,
    @Query("page") int page,
  );

  /// Top Rated
  @GET(ApiConstants.topRated)
  Future<PaginatedMediaResponse> getTopRated(
    @Path("media_type") String mediaType,
    @Query("page") int page,
  );

  /// Details
  @GET(ApiConstants.details)
  Future<MediaDetailsModel> getDetails(
    @Path("media_type") String mediaType,
    @Path("id") int id,
  );

  /// Reviews
  @GET(ApiConstants.reviews)
  Future<ReviewsResponseModel> getReviews(
    @Path("media_type") String mediaType,
    @Path("id") int id,
  );

  /// Credits
  @GET(ApiConstants.credits)
  Future<CreditsResponseModel> getCredits(
    @Path("media_type") String mediaType,
    @Path("id") int id,
  );

  /// Search
  @GET(ApiConstants.search)
  Future<PaginatedMediaResponse> search(
    @Query("query") String query,
    @Query("page") int page,
  );

  /// Discover by genre
  @GET(ApiConstants.discover)
  Future<PaginatedMediaResponse> discoverByGenre(
    @Path("media_type") String mediaType,
    @Query("with_genres") int genreId,
    @Query("page") int page,
  );
}
