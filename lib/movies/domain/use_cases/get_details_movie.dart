import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/BaseUseCase/base_use_case.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetDetailsMoviesUseCases extends BaseUseCase<MoviesDetails, MovieDetailsParameters> {
  BaseMovieRepository baseMovieRepository;

  GetDetailsMoviesUseCases({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MoviesDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getDetailsMovies(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int moviesId;

  const MovieDetailsParameters({required this.moviesId});

  @override
  // TODO: implement props
  List<Object?> get props => [moviesId];
}
