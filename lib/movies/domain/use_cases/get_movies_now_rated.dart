import 'package:dartz/dartz.dart';
import 'package:movie_app/core/BaseUseCase/base_use_case.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetMoviesNowRatedUseCases extends BaseUseCase<List<Movies>,NoParameters> {

  late BaseMovieRepository baseMovieRepository;

  GetMoviesNowRatedUseCases({required this.baseMovieRepository});


  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters)async {
    return await baseMovieRepository.getRatedMovies();

  }

}