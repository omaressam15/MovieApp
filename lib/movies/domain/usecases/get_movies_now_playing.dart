import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import '../../../core/error/failure.dart';

class GetMoviesNowPlayingUseCases {

  late BaseMovieRepository baseMovieRepository;

  GetMoviesNowPlayingUseCases(this.baseMovieRepository);

  Future<Either<Failure,List<Movies>>> execute ()async {

   return await baseMovieRepository.getNowPlayingMovies();

  }

}