import '../../domain/entities/movie_detailes.dart';

class MovieDetailesModel extends MovieDetailes {
  const MovieDetailesModel(
      {required super.backDrobPath,
      required super.genres,
      required super.overview,
      required super.id,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.runtime});

  factory MovieDetailesModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailesModel(
      backDrobPath: json['backdrop_path'],
      genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
      overview: json['overview'],
      id: json['id'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'],
    );
  }
}

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(name: json['name'], id: json['id']);
  }
}
