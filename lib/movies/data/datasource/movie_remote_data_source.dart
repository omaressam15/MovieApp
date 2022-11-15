import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {

  Future<List<MovieModel>> getNowPlayMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();

}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {

 @override
  Future<List<MovieModel>> getNowPlayMovies() async {
    final response = await Dio().get(ApiConstance.baseUrl(ApiConstance.nowPlayingMovies));
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    }else{

    throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.baseUrl(ApiConstance.popularMovies));

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
    final response = await Dio().get(ApiConstance.baseUrl(ApiConstance.topRatedMovies));

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map(
              (e) => MovieModel.fromJson(e)
      ));
    }else{

      throw  ServerException(errorMassage: ErrorMassageModel.fromJson(response.data));

    }
  }

}