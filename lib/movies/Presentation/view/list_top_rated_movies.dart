import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../components/see_more_widget.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_state.dart';
import '../screens/movies_details.dart';
class RatedMoviesView extends StatelessWidget {
  const RatedMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
      previous.statesTopRatedMovies != current.statesTopRatedMovies,
      builder: (context, state) {
        print('Rated');
        switch (state.statesTopRatedMovies) {

          case RequestStates.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case RequestStates.loaded:
            return  NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    centerTitle: true,
                    pinned: true,
                    collapsedHeight: 70,
                    title: const Text('Top Rated'),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ];
              },
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) {
                  final topPopularMovies = state.topRatedMovies[index];
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieDetailScreen(id: topPopularMovies.id,)),
                            /// TODO : NAVIGATE TO MOVIE DETAILS
                          );
                        },
                        child: SeeMoreWidget(
                          title: topPopularMovies.title,
                          image: topPopularMovies.backdropPath,
                          overview: topPopularMovies.overview,
                          releaseDate: topPopularMovies.releaseDate,
                          voteAverage: topPopularMovies.voteAverage,
                        )
                    ),
                  );
                },
                itemCount: state.topRatedMovies.length,
              ),
            );


          case RequestStates.error:
            return Text(state.massageTopPopular);
        }
      },
    );
  }
}