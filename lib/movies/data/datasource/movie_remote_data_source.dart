import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/movies/data/models/movie_details.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/data/models/recommendations_movies.dart';
import 'package:movie_app/movies/domain/use_cases/get_details_movie.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendations_movies.dart';

abstract class BaseMoviesRemoteDataSource {

  Future<List<MovieModel>> getNowPlayMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MovieDetailsInit> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationsModelInti>> getRecommendationsMovie(RecommendationsParameters parameters);

}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {

 @override
  Future<List<MovieModel>> getNowPlayMovies() async {

    final response = await Dio().get(ApiConstance.nowPlayingMovies);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map(
              (e) {
                return MovieModel.fromJson(e);
              }
      ));
    }else{

    throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMovies);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    }else{

      throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await Dio().get(ApiConstance.topRatedMovie);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    }else{

      throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }
  }

  @override
  Future<MovieDetailsInit> getMovieDetails(MovieDetailsParameters parameters)async {
    final response = await Dio().get(ApiConstance.getMovieDetails(parameters.moviesId));

    if(response.statusCode == 200){
      return MovieDetailsInit.fromJson(response.data);

    }else{

      throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }
  }
///getRecommendationsMovie
  @override
  Future<List<RecommendationsModelInti>> getRecommendationsMovie(RecommendationsParameters parameters)async {
    final response = await Dio().get(ApiConstance.getRecommendationsMovie(parameters.id));

    if(response.statusCode == 200){
      return List<RecommendationsModelInti>.from((response.data['results'] as List).map(
              (e) => RecommendationsModelInti.fromJson(e),
      ));
    }else{

      throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }
  }

}