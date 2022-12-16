
class ApiConstance{

  static String baseUrl ='https://api.themoviedb.org/3';

  static String key = '7607d296a2b871e08204f71901e48b4d';

  static String nowPlayingMovies = '$baseUrl/movie/now_playing?api_key=$key';
  static String popularMovies = '$baseUrl/movie/popular?api_key=$key';
  static String topRatedMovie = '$baseUrl/movie/top_rated?api_key=$key';

  static String getMovieDetails (int id) => '$baseUrl/movie/$id?api_key=$key';

  static String getRecommendationsMovie (int id) => '$baseUrl/movie/$id/recommendations?api_key=$key';


  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String getImage(String images)=>"$baseImageUrl$images";

}