import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_state.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/utils/enums.dart';
import '../screens/movies_details.dart';
class NowPlayingMoviesView extends StatelessWidget {
  const NowPlayingMoviesView({super.key});


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc,MoviesState>(
      buildWhen: (previous, current)=>
          previous.statesNowPlayingMovies !=current.statesNowPlayingMovies,

      builder: (BuildContext context, state) {

        switch(state.statesNowPlayingMovies){

          case RequestStates.loading:
            return const SizedBox(
              height: 400,
              child:Center(child: CircularProgressIndicator()) ,
            );

            case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 450.0,
                  viewportFraction: 1.0,
                  autoPlay: false,
                  autoPlayCurve:Curves.decelerate ,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                      (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        print('ID ${item.id}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieDetailScreen(id: item.id,)),
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        );},
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.3, 0.6, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              width: double.infinity,
                              height: 560.0,
                              imageUrl: ApiConstance.getImage(item.backdropPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'Now Playing'.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestStates.error:
            return SizedBox(
              height: 400,
              child:Center(child: Text(state.massageNowPlaying)) ,
            );
        }


      },
    );
  }
}
