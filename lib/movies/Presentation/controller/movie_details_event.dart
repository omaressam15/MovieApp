part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

}

class GetMoviesDetailsEvent extends MovieDetailsEvent{

  final int id;
  const GetMoviesDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[id];

}

class GetRecommendationMovieEvent extends MovieDetailsEvent {
 final int id ;

  const GetRecommendationMovieEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}