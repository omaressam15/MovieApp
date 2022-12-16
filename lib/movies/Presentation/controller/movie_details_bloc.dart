import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations_model.dart';
import '../../domain/use_cases/get_details_movie.dart';
import '../../domain/use_cases/get_recommendations_movies.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  GetDetailsMoviesUseCases getDetailsMoviesUseCases;
  GetRecommendationsMoviesUseCase getRecommendationsMoviesUseCase;

  MovieDetailsBloc({
    required this.getDetailsMoviesUseCases,
    required this.getRecommendationsMoviesUseCase
  }) : super( const MovieDetailsState()) {

    on<GetMoviesDetailsEvent>(_getMoviesDetails);
    on<GetRecommendationMovieEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    var result = await getDetailsMoviesUseCases(
        MovieDetailsParameters(moviesId: event.id));

     result.fold(
        (l) => emit(state.copyWith(
              moveDetailsMessage: l.message,
              moveDetailsStat: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
              moviesDetailsModel: r,
              moveDetailsStat: RequestStates.loaded,
            )));
  }

  FutureOr<void> _getRecommendationMovies(GetRecommendationMovieEvent event,
      Emitter<MovieDetailsState> emit) async {
    var result = await getRecommendationsMoviesUseCase(
        RecommendationsParameters(id: event.id));

     result.fold(
        (l) => emit(state.copyWith(
              moveRecommendationMessage: l.message,
              moveRecommendationStat: RequestStates.error,
            )),
        (r) => emit(state.copyWith(
            recommendationsModel: r,
            moveRecommendationStat: RequestStates.loaded)));
  }
}
