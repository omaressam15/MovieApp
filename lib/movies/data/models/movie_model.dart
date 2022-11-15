import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movies {
  const MovieModel({
    required super.releaseDate,
    required super.genreIds,
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage
  });

  factory MovieModel.fromJson(Map<String,dynamic> jason)=>
     MovieModel(
        releaseDate: jason['release_date'],
        genreIds: List<int>.from(jason['genre_ids'].map((e) => e)),
        id: jason['id'],
        title: jason['title'],
        backdropPath: jason['backdrop_path'],
        overview: jason['overview'],
        voteAverage: jason['vote_average'].toDouble()
    );


}