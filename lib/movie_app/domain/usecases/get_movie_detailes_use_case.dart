// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app_clean_arc/core/base_usecas/base_use_case.dart';
import 'package:movie_app_clean_arc/core/error/failer.dart';
import 'package:movie_app_clean_arc/movie_app/domain/entities/movie_detailes.dart';
import 'package:movie_app_clean_arc/movie_app/domain/repositories/base_movie_repo.dart';

class GetMovieDetailesUseCase extends BaseUseCase<MovieDetailes, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;
  GetMovieDetailesUseCase({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<Failuer, MovieDetailes>> call(MovieDetailsParameters paramters ) async {
    return await baseMovieRepo.getMovieDetailes(paramters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
