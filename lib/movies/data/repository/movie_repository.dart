import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMovieRepository{

  BaseMoviesRemoteDataSource baseMoviesRemoteDataSource ;


  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMoviesRemoteDataSource.getNowPlayMovies();
    try{
     return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassage.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getRatedMovies()async {
    final result = await baseMoviesRemoteDataSource.getTopRated();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassage.statusMassage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopPopularMovies()async {
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassage.statusMassage));
    }
  }
}