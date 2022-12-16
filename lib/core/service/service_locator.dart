import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_details_movie.dart';
import '../../movies/Presentation/controller/movie_details_bloc.dart';
import '../../movies/domain/use_cases/get_movies_now_playing.dart';
import '../../movies/domain/use_cases/get_movies_now_rated.dart';
import '../../movies/domain/use_cases/get_movies_top_popular.dart';
import '../../movies/domain/use_cases/get_recommendations_movies.dart';

final sl  = GetIt.instance;

class ServiceLocator {

  void init () {
    
    ///Bloc 
    sl.registerFactory(() => MoviesBloc(
        getMoviesNowPlayingUseCases: sl(),
        getMoviesNowRatedUseCases: sl(),
        getMoviesTopPopularUseCases: sl(),
    ));

    sl.registerFactory(() => MovieDetailsBloc(
        getDetailsMoviesUseCases: sl(),
        getRecommendationsMoviesUseCase: sl(),
    ));

    ///UseCases
    sl.registerLazySingleton(() => GetMoviesNowPlayingUseCases(baseMovieRepository: sl()));
    sl.registerLazySingleton(() => GetMoviesNowRatedUseCases(baseMovieRepository: sl()));
    sl.registerLazySingleton(() => GetMoviesTopPopularUseCases(baseMovieRepository:sl()));

    sl.registerLazySingleton(() => GetRecommendationsMoviesUseCase(baseMovieRepository:sl()));
    sl.registerLazySingleton(() => GetDetailsMoviesUseCases(baseMovieRepository: sl()));

    ///CREATE MOVIES REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
            () =>MoviesRemoteDataSource());
  }

}