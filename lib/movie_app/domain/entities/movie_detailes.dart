// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MovieDetailes extends Equatable {
  final String backDrobPath;
  final String overview;
  final int id;
  final String releaseDate;
  final String title;
  final num voteAverage;
  final int runtime;
  final List<Genres> genres;
  const MovieDetailes({
    required this.backDrobPath,
    required this.genres,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.runtime,
  });

  @override
  List<Object> get props {
    return [
      genres,
      backDrobPath,
      overview,
      id,
      releaseDate,
      title,
      voteAverage,
      runtime,
    ];
  }
}

class Genres extends Equatable {
  final String name;
  final int id;
  const Genres({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
