import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import '../../../core/service/service_locator.dart';
import '../view/list_popular_movies.dart';
import '../controller/movies_event.dart';

class SeeMorePopularMovies extends StatelessWidget {
  const SeeMorePopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetPopularMoviesEvent()),
      child: const Scaffold(
        backgroundColor: Color(0xff1e1e29),
        body: PopularMovies(),
      ),
    );
  }
}
