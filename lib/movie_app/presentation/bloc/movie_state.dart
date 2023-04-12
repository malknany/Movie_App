import 'package:equatable/equatable.dart';
import '../../../core/utality/request_state.dart';
import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String msg;

  final List<Movie> popularMovie;
  final RequestState popularMovieState;
  final String popularMovieMsg;

  final List<Movie> topRateMovie;
  final RequestState topRateMovieState;
  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.msg = '',
    this.popularMovie = const [],
    this.popularMovieState = RequestState.loading,
    this.topRateMovie = const [],
    this.topRateMovieState = RequestState.loading,
    this.popularMovieMsg = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovie,
        nowPlayingState,
        msg,
        popularMovieMsg,
        popularMovieMsg,
        popularMovieState,
        topRateMovie,
        topRateMovieState
      ];

  MovieState copyWith({
     List<Movie>? topRateMovie,
   RequestState? topRateMovieState,
     List<Movie>? nowPlayingMovie,
   RequestState? nowPlayingState,
   String? msg,
       List<Movie>? popularMovie,
   RequestState? popularMovieState,
   String? popularMovieMsg,
  }) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState??this.nowPlayingState,
      popularMovie: popularMovie??this.popularMovie,
      msg: msg??this.msg,
      popularMovieState: popularMovieState??this.popularMovieState,
      popularMovieMsg: popularMovieMsg??this.popularMovieMsg,
      topRateMovie: topRateMovie??this.topRateMovie,
      topRateMovieState: topRateMovieState??this.topRateMovieState
    );
  }
}

class MovieInitial extends MovieState {}
