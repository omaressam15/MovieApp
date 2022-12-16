
import 'package:movie_app/movies/domain/entities/recommendations_model.dart';

class RecommendationsModelInti extends RecommendationsModel{

  const RecommendationsModelInti({

    required super.id,
    super.backdropPath,

  });

  factory RecommendationsModelInti.fromJson(Map<String,dynamic>json){

   return RecommendationsModelInti(
      backdropPath: json['backdrop_path'] ??'/rFljUdOozFEv6HDHIFpFvcYW0ec.jpg',
      id: json['id'],
    );
  }
}