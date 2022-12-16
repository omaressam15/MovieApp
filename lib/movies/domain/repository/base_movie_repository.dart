import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations_model.dart';
import 'package:movie_app/movies/domain/use_cases/get_details_movie.dart';
import '../../../core/error/failure.dart';
import '../use_cases/get_recommendations_movies.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure,List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movies>>> getTopPopularMovies();

  Future<Either<Failure,List<Movies>>> getRatedMovies();

  Future<Either<Failure,MoviesDetails>> getDetailsMovies(MovieDetailsParameters parameters);

  Future<Either<Failure,List<RecommendationsModel>>> getRatedRecommendationsMovies(RecommendationsParameters parameters);

}