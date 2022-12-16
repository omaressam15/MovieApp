import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {

  ///NowPlayingMovies
  final List<Movies> nowPlayingMovies;
  final RequestStates statesNowPlayingMovies;
  final String massageNowPlaying;

  ///PopularMovies
  final List<Movies> topPopularMovies;
  final RequestStates statesTopPopularMovies;
  final String massageTopPopular;

  ///RatedMovies
  final List<Movies> topRatedMovies;
  final RequestStates statesTopRatedMovies;
  final String massageTopRated;



  const MoviesState(
      {
    this.nowPlayingMovies = const [],
    this.statesNowPlayingMovies = RequestStates.loading,
    this.massageNowPlaying = '',

    this.topPopularMovies = const [],
    this.statesTopPopularMovies = RequestStates.loading,
    this.massageTopPopular = '',

    this.topRatedMovies = const [],
    this.statesTopRatedMovies = RequestStates.loading,
    this.massageTopRated = '',


  });

  MoviesState copyWith({
    ///NowPlayingMovies
     List<Movies>? nowPlayingMovies,
     RequestStates? statesNowPlayingMovies,
     String? massageNowPlaying,

    ///PopularMovies
     List<Movies>? topPopularMovies,
     RequestStates? statesTopPopularMovies,
     String? massageTopPopular,

    ///RatedMovies
     List<Movies>? topRatedMovies,
     RequestStates? statesTopRatedMovies,
     String? massageTopRated,


}){
    return  MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      massageNowPlaying: massageNowPlaying ?? this.massageNowPlaying,
      statesNowPlayingMovies: statesNowPlayingMovies ?? this.statesNowPlayingMovies,

      topPopularMovies: topPopularMovies ?? this.topPopularMovies,
      statesTopPopularMovies: statesTopPopularMovies ?? this.statesTopPopularMovies,
      massageTopPopular: massageTopPopular ?? this.massageTopPopular,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      statesTopRatedMovies: statesTopRatedMovies ?? this.statesTopRatedMovies,
      massageTopRated: massageTopRated ?? this.massageTopRated,


    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    statesNowPlayingMovies,
    massageNowPlaying,

    topPopularMovies,
    statesTopPopularMovies,
    massageTopPopular,

    topRatedMovies,
    statesTopRatedMovies,
    massageTopRated,

  ];


}