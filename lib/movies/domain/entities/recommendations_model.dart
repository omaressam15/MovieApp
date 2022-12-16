import 'package:equatable/equatable.dart';

class RecommendationsModel extends Equatable {

  final int id ;

  final String? backdropPath;


  const RecommendationsModel({required this.id,this.backdropPath});

  @override
  // TODO: implement props PpPp
  List<Object?> get props => [id,backdropPath];



}