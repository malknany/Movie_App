import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utality/request_state.dart';
import '../../../domain/usecases/get_movie_detailes_use_case.dart';
import '../../../domain/usecases/get_recommendation.dart';
import 'movie_detailes_event.dart';
import 'movie_detailes_state.dart';

class MovieDetailesBloc extends Bloc<MovieDetailesEvent, MovieDetailesState> {
  MovieDetailesBloc(this.getMovieDetailesUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailesState()) {
    on<GetMovieDetailes>(_getMovieDetailes);
    on<GetRecommendation>(_getRecommendation);
  }

  final GetMovieDetailesUseCase getMovieDetailesUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetailes(
      GetMovieDetailes event, Emitter<MovieDetailesState> emit) async {
    final result = await getMovieDetailesUseCase(
        MovieDetailsParameters(movieId: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          movieMsg: l.mas,
          requestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailes: r,
          requestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(
      GetRecommendation event, Emitter<MovieDetailesState> emit) async {
    final result = await getRecommendationUseCase(
      RecommendationParamters(
        id: event.id,
      ),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationMovieMsg: l.mas,
          recommendationsRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          recommendationsRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
