import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/Presentation/view/list_top_rated_movies.dart';
import '../../../core/service/service_locator.dart';
import '../controller/movies_event.dart';

class SeeMoreRatedMovies extends StatelessWidget {
  const SeeMoreRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetRatingMoviesEvent()),
      child: const Scaffold(
        backgroundColor: Color(0xff1e1e29),
        body: RatedMoviesView(),
      ),
    );
  }
}
