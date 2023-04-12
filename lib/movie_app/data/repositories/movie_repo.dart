import '../../domain/entities/movie_detailes.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_detailes_use_case.dart';
import '../../domain/usecases/get_recommendation.dart';

import '../../../core/error/failer.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/server_exceptions.dart';
import '../datasources/remot_data_source.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/base_movie_repo.dart';

class MovieRepo extends BaseMovieRepo {
  final BaseRemotDataSource baseRemotDataSource;
  MovieRepo(this.baseRemotDataSource);

  @override
  Future<Either<Failuer, List<Movie>>> getNowPlaying() async {
    final response = await baseRemotDataSource.getNowPlay();
    try {
      return Right(response);
    } on ServeierException catch (e) {
      return Left(
        ServerFailuer(
          mas: e.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getPopular() async {
    final response = await baseRemotDataSource.getPopular();
    try {
      return Right(response);
    } on ServeierException catch (e) {
      return Left(
        ServerFailuer(
          mas: e.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getTopRate() async {
    final response = await baseRemotDataSource.getTopRate();
    try {
      return Right(response);
    } on ServeierException catch (e) {
      return Left(
        ServerFailuer(
          mas: e.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failuer, MovieDetailes>> getMovieDetailes(
      MovieDetailsParameters movieId) async {
    final response = await baseRemotDataSource.getMovieDetailes(movieId);
    try {
      return Right(response);
    } on ServeierException catch (e) {
      return Left(
        ServerFailuer(
          mas: e.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failuer, List<Recommendation>>> getRecommendation(RecommendationParamters movieId)async {
    final response = await baseRemotDataSource.getRecommendation(movieId);
    try {
      return Right(response);
    } on ServeierException catch (e) {
      return Left(
        ServerFailuer(
          mas: e.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
