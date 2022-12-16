import 'package:dartz/dartz.dart';
import 'package:movie_app/core/BaseUseCase/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import '../../../core/error/failure.dart';

class GetMoviesNowPlayingUseCases extends BaseUseCase<List<Movies>,NoParameters> {

  late BaseMovieRepository baseMovieRepository;

  GetMoviesNowPlayingUseCases({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(parameters)async {
    // TODO: implement call
    return await baseMovieRepository.getNowPlayingMovies();
  }



}