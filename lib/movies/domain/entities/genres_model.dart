
import 'package:equatable/equatable.dart';

class GenresModel extends Equatable{

  final int id ;

  final String name;

  const GenresModel({required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
  ];
}