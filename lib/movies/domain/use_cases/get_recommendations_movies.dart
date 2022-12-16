import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/BaseUseCase/base_use_case.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/recommendations_model.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationsMoviesUseCase extends BaseUseCase<List<RecommendationsModel>,RecommendationsParameters>{

  BaseMovieRepository baseMovieRepository;


  GetRecommendationsMoviesUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<RecommendationsModel>>> call(RecommendationsParameters parameters) async {

    return baseMovieRepository.getRatedRecommendationsMovies(parameters);

  }
}

class RecommendationsParameters extends Equatable{

  final int id;

  const RecommendationsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];


}