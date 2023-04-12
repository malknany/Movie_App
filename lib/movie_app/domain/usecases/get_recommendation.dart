// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app_clean_arc/core/base_usecas/base_use_case.dart';
import 'package:movie_app_clean_arc/core/error/failer.dart';
import 'package:movie_app_clean_arc/movie_app/domain/entities/recommendation.dart';
import 'package:movie_app_clean_arc/movie_app/domain/repositories/base_movie_repo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParamters> {
  final BaseMovieRepo baseMovieRepo;
  GetRecommendationUseCase({
    required this.baseMovieRepo,
  });
  @override
  Future<Either<Failuer, List<Recommendation>>> call(
      RecommendationParamters paramters) async {
    return await baseMovieRepo.getRecommendation(paramters);
  }
}

class RecommendationParamters extends Equatable {
  final int id;
  const RecommendationParamters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
