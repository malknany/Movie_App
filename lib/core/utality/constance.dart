class AppConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = "b4e1bccc2cfba88d3d677c01fec37548";
  static const String nowPlay = "movie/now_playing?api_key=$apiKey";
  static const String popular = "movie/popular?api_key=$apiKey";
  static const String topRate = "movie/top_rated?api_key=$apiKey";
  static  String getMovieDetailesPath(int idMovie) => "movie/$idMovie?api_key=$apiKey";
  static  String getRecommendationPath(int idMovie) => "movie/$idMovie/recommendations?api_key=$apiKey";
  static const String baseUrlImage = "https://image.tmdb.org/t/p/w500";

  static String getImage(String path )=>'$baseUrlImage$path';
}
//https://api.themoviedb.org/3/movie/now_playing?api_key=b4e1bccc2cfba88d3d677c01fec37548


//https://api.themoviedb.org/3/movie/980078?api_key=b4e1bccc2cfba88d3d677c01fec37548


//https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=b4e1bccc2cfba88d3d677c01fec37548