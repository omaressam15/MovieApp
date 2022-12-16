import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/BaseUseCase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/Presentation/controller/movies_event.dart';
import 'package:movie_app/movies/Presentation/controller/movies_state.dart';
import '../../domain/use_cases/get_movies_now_playing.dart';
import '../../domain/use_cases/get_movies_now_rated.dart';
import '../../domain/use_cases/get_movies_top_popular.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesNowPlayingUseCases getMoviesNowPlayingUseCases;
  final GetMoviesTopPopularUseCases getMoviesTopPopularUseCases;
  final GetMoviesNowRatedUseCases getMoviesNowRatedUseCases;

  MoviesBloc({
     required this.getMoviesNowPlayingUseCases,
     required this.getMoviesTopPopularUseCases,
     required this.getMoviesNowRatedUseCases})
      : super(const MoviesState()) {

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetRatingMoviesEvent>(_getTopRatedMovies);
  }

  Future<FutureOr<void>> _getNowPlayingMovies(event, emit) async {
    final results = await getMoviesNowPlayingUseCases.call(const NoParameters());

    results.fold(
        (l) => emit(state.copyWith(
            massageNowPlaying: l.message,
            statesNowPlayingMovies: RequestStates.error)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r,
            statesNowPlayingMovies: RequestStates.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final results = await getMoviesTopPopularUseCases.call(const NoParameters());

    results.fold(
        (l) => emit(state.copyWith(
              statesTopPopularMovies: RequestStates.error,
              massageTopPopular: l.message,
            )),
        (r) => emit(state.copyWith(
            statesTopPopularMovies: RequestStates.loaded,
            topPopularMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetRatingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getMoviesNowRatedUseCases.call(const NoParameters());

    result.fold(
        (l) => emit(
            state.copyWith(
              statesTopRatedMovies: RequestStates.error,
              massageTopRated: l.message,
            )),
        (r) =>emit(
            state.copyWith(
              topRatedMovies: r,
              statesTopRatedMovies: RequestStates.loaded,
            )
        ));
  }
}
