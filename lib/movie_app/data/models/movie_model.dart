import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.overview,
    required super.originalTitle,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        backdropPath: json["backdrop_path"]??'/wD2kUCX1Bb6oeIb2uz7kbdfLP6k.jpg',
        title: json['title'],
        overview: json['overview'],
        originalTitle: json['original_title'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
      );

  Map<String, dynamic> toJson() => {
    'id':id,
    'backdrop_path':backdropPath,
    'title':title,
    'overview':overview,
    'original_title':originalTitle,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "release_date": releaseDate,
    "vote_average": voteAverage,
  };
}
