
abstract class MoviesEvent {

  MoviesEvent();
}

class GetNowPlayingMoviesEvent extends MoviesEvent{}

class GetPopularMoviesEvent extends MoviesEvent{}

class GetRatingMoviesEvent extends MoviesEvent{}