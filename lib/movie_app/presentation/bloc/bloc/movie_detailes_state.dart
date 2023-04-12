// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movie_app_clean_arc/core/utality/request_state.dart';
import 'package:movie_app_clean_arc/movie_app/domain/entities/movie_detailes.dart';
import 'package:movie_app_clean_arc/movie_app/domain/entities/recommendation.dart';

class MovieDetailesState extends Equatable {
  final MovieDetailes? movieDetailes;
  final RequestState requestState;
  final String movieMsg;

  final List<Recommendation> recommendations;
  final RequestState recommendationsRequestState;
  final String recommendationMovieMsg;

  const MovieDetailesState({
    this.recommendations = const [],
    this.recommendationsRequestState = RequestState.loading,
    this.recommendationMovieMsg = '',
    this.movieDetailes,
    this.requestState = RequestState.loading,
    this.movieMsg = '',
  });



  MovieDetailesState copyWith({
    MovieDetailes? movieDetailes,
    RequestState? requestState,
    String? movieMsg,
    List<Recommendation>? recommendations,
    RequestState? recommendationsRequestState,
    String? recommendationMovieMsg,
  }) {
    return MovieDetailesState(
      movieDetailes: movieDetailes ?? this.movieDetailes,
      requestState: requestState ?? this.requestState,
      movieMsg: movieMsg ?? this.movieMsg,
      recommendations: recommendations ?? this.recommendations,
      recommendationsRequestState:
          recommendationsRequestState ?? this.recommendationsRequestState,
      recommendationMovieMsg:
          recommendationMovieMsg ?? this.recommendationMovieMsg,
    );
  }

  @override
  List<Object?> get props {
    return [
      movieDetailes,
      requestState,
      movieMsg,
      recommendations,
      recommendationsRequestState,
      recommendationMovieMsg,
    ];
  }
}
