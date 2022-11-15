import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetMoviesNowRatedUseCases {

  late BaseMovieRepository baseMovieRepository;

  GetMoviesNowRatedUseCases(this.baseMovieRepository);

  Future<Either<Failure,List<Movies>>> execute ()async {

    return await baseMovieRepository.getRatedMovies();

  }

}