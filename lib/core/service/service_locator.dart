
import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movies_now_playing.dart';

final sl  = GetIt.instance;

class ServiceLocator {

  void init () {
    
    ///Bloc 
    sl.registerFactory(() => MoviesBloc(sl()));

    ///UseCases
    sl.registerLazySingleton(() => GetMoviesNowPlayingUseCases(sl()));


    ///CREATE MOVIES REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
            () =>MoviesRemoteDataSource());
  }

}