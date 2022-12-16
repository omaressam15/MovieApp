import 'package:equatable/equatable.dart';

import 'genres_model.dart';

class MoviesDetails extends Equatable {

 final String backdropPath;
 final int id;
 final String title;
 final List<GenresModel> genresModel;
 final String overView;
 final String? posterPath;
 final String releaseDate;
 final int runTime;
 final double voteAverage;

 const MoviesDetails({
     required this.backdropPath,
     required this.genresModel,
     required this.id,
     required this.title,
     required this.overView,
     this.posterPath,
     required this.releaseDate,
     required this.runTime,
     required this.voteAverage

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    id,
    title,
    genresModel,
    overView,
    posterPath,
    releaseDate,
    runTime,
    voteAverage

  ];
}

