// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class MovieDetailesEvent extends Equatable {
  const MovieDetailesEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailes extends MovieDetailesEvent {
  final int id;
  const GetMovieDetailes(this.id);

  @override
  List<Object> get props => [id];
}


class GetRecommendation extends MovieDetailesEvent {
  final int id;
  const GetRecommendation({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
