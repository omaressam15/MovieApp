import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {

  final List<Movies> nowPlayingMovies;

  final RequestStates request;

  final String massageNowPlaying;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.request = RequestStates.loading,
    this.massageNowPlaying = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    request,
    massageNowPlaying,
  ];


}