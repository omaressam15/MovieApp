import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/Presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/utils/enums.dart';
import '../screens/movies_details.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MoviesBloc,MoviesState>(
        buildWhen: (previous, current)=>
        previous.statesTopPopularMovies !=current.statesTopPopularMovies,
        builder: (context,stats){

           switch(stats.statesTopPopularMovies){

             case RequestStates.loading:
               return const SizedBox(
                 height: 170,
                 child:Center(child: CircularProgressIndicator()) ,
               );

             case RequestStates.loaded:
               return FadeIn(
                 duration: const Duration(milliseconds: 500),
                 child: SizedBox(
                   height: 170.0,
                   child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                     itemCount: stats.topPopularMovies.length,
                     itemBuilder: (context, index) {
                       final movie = stats.topPopularMovies[index];
                       return Container(
                         padding: const EdgeInsets.only(right: 10.0),
                         child: InkWell(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id,)),
                               /// TODO : NAVIGATE TO MOVIE DETAILS
                             );
                           },
                           child: ClipRRect(
                             borderRadius:
                             const BorderRadius.all(Radius.circular(8.0)),
                             child: CachedNetworkImage(
                               width: 120.0,
                               fit: BoxFit.cover,
                               imageUrl: ApiConstance.getImage(movie.backdropPath),
                               placeholder: (context, url) => Shimmer.fromColors(
                                 baseColor: Colors.grey[850]!,
                                 highlightColor: Colors.grey[800]!,
                                 child: Container(
                                   height: 170.0,
                                   width: 120.0,
                                   decoration: BoxDecoration(
                                     color: Colors.black,
                                     borderRadius: BorderRadius.circular(8.0),
                                   ),
                                 ),
                               ),
                               errorWidget: (context, url, error) =>
                               const Icon(Icons.error),
                             ),
                           ),
                         ),
                       );
                     },
                   ),
                 ),
               );
             case RequestStates.error:
               return SizedBox(
                 height: 170,
                 child:Center(child: Text(stats.massageTopPopular)) ,
               );
          }
        }
    );
  }
}
