import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/components/see_more_widget.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_state.dart';
import '../screens/movies_details.dart';
class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
      previous.statesTopPopularMovies != current.statesTopPopularMovies,
      builder: (context, state) {
        print('popular');
        switch (state.statesTopPopularMovies) {

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
                    title: const Text('Top Popular'),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ),
                ];
              },
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) {
                  final topPopularMovies = state.topPopularMovies[index];
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
                itemCount: state.topPopularMovies.length,
              ),
            );


          case RequestStates.error:
            return Text(state.massageTopPopular);
        }
      },
    );
  }
}