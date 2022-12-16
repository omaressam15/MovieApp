import 'package:movie_app/movies/domain/entities/genres_model.dart';

class GenresModelInit extends GenresModel {
  const GenresModelInit({required super.id, required super.name});

  factory GenresModelInit.from(Map<String, dynamic> json) =>
      GenresModelInit(id: json['id'], name: json['name']);
}
