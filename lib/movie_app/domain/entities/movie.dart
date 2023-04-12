import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String originalTitle;
  final List<int> genreIds;
  final num voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.originalTitle,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      backdropPath,
      title,
      overview,
      originalTitle,
      genreIds,
      voteAverage,
      releaseDate,
    ];
  }
}

/* @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.backdropPath == backdropPath &&
      other.title == title &&
      other.overview == overview &&
      other.originalTitle == originalTitle &&
      listEquals(other.genreIds, genreIds) &&
      other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      backdropPath.hashCode ^
      title.hashCode ^
      overview.hashCode ^
      originalTitle.hashCode ^
      genreIds.hashCode ^
      voteAverage.hashCode;
  }
   */
