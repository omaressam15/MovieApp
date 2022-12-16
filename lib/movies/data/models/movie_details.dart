import 'package:movie_app/movies/data/models/genres_inti.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsInit extends MoviesDetails{
  const MovieDetailsInit({

    required super.backdropPath,
    required super.genresModel,
    required super.id,
    required super.title,
    required super.overView,
    required super.posterPath,
    required super.releaseDate,
    required super.runTime,
    required super.voteAverage
  });

  factory MovieDetailsInit.fromJson (Map<String,dynamic> jason)=>
    MovieDetailsInit(
       backdropPath: jason['backdrop_path'],

       genresModel: List<GenresModelInit>.from(jason['genres'].map((e) => GenresModelInit.from(e))),
       id: jason ['id'],
       title: jason ['title'],
       overView: jason ['overview'],
       posterPath: jason ['poster_path'],
       releaseDate: jason ['release_date'],
       runTime: jason ['runtime'],
       voteAverage: jason ['vote_average']
   );

}