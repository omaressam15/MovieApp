import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import '../../../core/error/failure.dart';


abstract class BaseMovieRepository{

  Future<Either<Failure,List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movies>>> getTopPopularMovies();
  Future<Either<Failure,List<Movies>>> getRatedMovies();

}