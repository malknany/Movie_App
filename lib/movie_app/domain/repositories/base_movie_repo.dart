import 'package:dartz/dartz.dart';
import '../entities/movie_detailes.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_detailes_use_case.dart';
import '../usecases/get_recommendation.dart';
import '../../../core/error/failer.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepo {
  Future<Either<Failuer,List<Movie>>> getNowPlaying();
  Future<Either<Failuer,List<Movie>>> getPopular();
  Future<Either<Failuer,List<Movie>>> getTopRate();
  Future<Either<Failuer,MovieDetailes>> getMovieDetailes(MovieDetailsParameters movieId);
  Future<Either<Failuer,List<Recommendation>>> getRecommendation(RecommendationParamters movieId);
}
