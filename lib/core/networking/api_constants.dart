class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyODYzZWUzZDBlY2U4MjBkZmM2N2U5YWYzYjgwZDM4YSIsIm5iZiI6MTc3MDUzNDk4MC45MTM5OTk4LCJzdWIiOiI2OTg4Mzg0NDBiNDVjNTAzNTU4ZmNiZmUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.WFu-QkJrubPYZyBLCOLxVBF0sOLloA_4zdhsIFIJh1U";

  /// Trending (movie / tv)
  static const trending = "/trending/{media_type}/{time_window}";

  /// Popular / Top Rated
  static const popular = "/{media_type}/popular";
  static const topRated = "/{media_type}/top_rated";

  /// Details
  static const details = "/{media_type}/{id}";
  static const reviews = "/{media_type}/{id}/reviews";
  static const credits = "/{media_type}/{id}/credits";

  /// Search
  static const search = "/search/multi";

  /// Discover (genre)
  static const discover = "/discover/{media_type}";
}
