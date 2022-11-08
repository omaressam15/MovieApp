import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetMoviesNowRated {

  late BaseMovieRepository baseMovieRepository;

  GetMoviesNowRated(this.baseMovieRepository);

  Future<Either<Failure,List<Movies>>> execute ()async {

    return await baseMovieRepository.getRatedMovies();

  }

}