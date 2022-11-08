import 'package:equatable/equatable.dart';

class Movies extends Equatable {

  final int id ;
  final String title;
  final String backdropPath;
  final List<int> genreIde ;
  final String overview;
  final double voteAverage;
  final double releaseDate;

 const Movies({
     required this.releaseDate,
     required this.genreIde,
     required this.id,
     required this.title,
     required this.backdropPath,
     required this.overview,
     required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    releaseDate,
    title,
    genreIde,
    backdropPath,
    overview,
    voteAverage,
  ];





}

