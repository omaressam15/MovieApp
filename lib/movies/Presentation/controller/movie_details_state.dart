part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

 final MoviesDetails? moviesDetailsModel ;
 final RequestStates moveDetailsStat;
 final String moveDetailsMessage ;

 final List <RecommendationsModel> recommendationsModel ;
 final RequestStates moveRecommendationStat;
 final String? moveRecommendationMessage ;

 const MovieDetailsState({
   this.moviesDetailsModel,
   this.moveDetailsMessage = '',
   this.moveDetailsStat = RequestStates.loading,


   this.recommendationsModel  = const [],
   this.moveRecommendationStat =RequestStates.loading,
   this.moveRecommendationMessage = '',
 });

 MovieDetailsState copyWith({
    MoviesDetails? moviesDetailsModel,
    RequestStates? moveDetailsStat,
    String? moveDetailsMessage,

    List<RecommendationsModel> ? recommendationsModel,
    RequestStates ? moveRecommendationStat,
    String? moveRecommendationMessage ,
  }) {
    return MovieDetailsState(
        moviesDetailsModel: moviesDetailsModel ?? this.moviesDetailsModel,
        moveDetailsMessage: moveDetailsMessage ?? this.moveDetailsMessage,
        moveDetailsStat: moveDetailsStat ?? this.moveDetailsStat,

        recommendationsModel: recommendationsModel ?? this.recommendationsModel,
        moveRecommendationStat: moveRecommendationStat ??this.moveRecommendationStat,
        moveRecommendationMessage: moveRecommendationMessage ??this.moveRecommendationMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    moviesDetailsModel,
    moveDetailsMessage,
    moveDetailsStat,

    recommendationsModel,
    moveRecommendationMessage,
    moveRecommendationStat,

  ];
}
