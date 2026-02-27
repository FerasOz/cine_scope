class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyODYzZWUzZDBlY2U4MjBkZmM2N2U5YWYzYjgwZDM4YSIsIm5iZiI6MTc3MDUzNDk4MC45MTM5OTk4LCJzdWIiOiI2OTg4Mzg0NDBiNDVjNTAzNTU4ZmNiZmUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.WFu-QkJrubPYZyBLCOLxVBF0sOLloA_4zdhsIFIJh1U";
  static const trendingMovies = "/trending/movie/day";
  static const trendingMoviesWeek = "/trending/movie/week";
  static const popularMovies = "/movie/popular";
  static const topRatedMovies = "/movie/top_rated";
  static const searchMovies = "/search/movie";
  static const genrehMovies = "/discover/movie";
  static const movieDetails = "movie/{movie_id}";
  static const movieReviews = "movie/{movie_id}/reviews";
  static const movieCasts= "movie/{movie_id}/credits";
}
