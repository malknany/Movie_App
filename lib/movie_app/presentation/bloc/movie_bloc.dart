import 'dart:async';

import '../../../core/base_usecas/base_use_case.dart';
import '../../domain/usecases/get_popular.dart';
import '../../domain/usecases/get_top_rate.dart';
import '../../../core/utality/request_state.dart';
import '../../domain/usecases/get_now_playing.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRateMovies getTopRateMovies;
  MovieBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.getTopRateMovies)
      : super(MovieInitial()) {
    on<GetNowPlayingEvent>(_onNowPlaying);

    on<GetPopularEvent>(_onPopular);

    on<GetTopRateEvent>(_onTopRate);
  }

  FutureOr<void> _onNowPlaying(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    // i use callalbal class as function
    final result = await getNowPlayingMovies(const NoParamters());
    result.fold(
      (l) => emit(
        state.copyWith(
          msg: l.mas,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovie: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _onPopular(event, emit) async {
    final result = await getPopularMovies(const NoParamters());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularMovieMsg: l.mas,
          popularMovieState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovie: r,
          popularMovieState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _onTopRate(event, emit) async {
    final result = await getTopRateMovies(const NoParamters());

    result.fold(
        (l) => emit(
            state.copyWith(msg: l.mas, topRateMovieState: RequestState.error)),
        (r) => emit(state.copyWith(
            topRateMovie: r, topRateMovieState: RequestState.loaded)));
  }
}
