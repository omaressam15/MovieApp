
class ApiConstance{

  static String baseUrl(String url){
    return 'https://api.themoviedb.org/3/movie/$url?api_key=$key';
  }
  static String key = '7607d296a2b871e08204f71901e48b4d';

  static String nowPlayingMovies = 'now_playing';
  static String popularMovies = 'popular';
  static String topRatedMovies = 'top_rated';

  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String getImage(String images)=>"$baseImageUrl$images";

}