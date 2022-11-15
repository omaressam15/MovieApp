import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_event.dart';
import 'package:movie_app/movies/Presentation/controller/movies_state.dart';
import 'package:movie_app/movies/domain/usecases/get_movies_now_playing.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  final GetMoviesNowPlayingUseCases getMoviesNowPlayingUseCases;

  MoviesBloc(this.getMoviesNowPlayingUseCases) : super (const MoviesState()) {

    on<GetNowPlayingMoviesEvent>((event, emit) async {

    final results = await getMoviesNowPlayingUseCases.execute();

    print('OMARRRRRRRRRRR $results');
    });


  }


}