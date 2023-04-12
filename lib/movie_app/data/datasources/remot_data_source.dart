import 'package:dio/dio.dart';
import '../models/movie_detailes_model.dart';
import '../models/recommendation_model.dart';
import '../../domain/usecases/get_movie_detailes_use_case.dart';
import '../../domain/usecases/get_recommendation.dart';

import '../../../core/error/server_exceptions.dart';
import '../../../core/network/error_message.dart';
import '../../../core/utality/constance.dart';
import '../models/movie_model.dart';

abstract class BaseRemotDataSource {
  Future<List<MovieModel>> getNowPlay();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getTopRate();
  Future<MovieDetailesModel> getMovieDetailes(
      MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParamters parameters);
}

class RemotDataSource extends BaseRemotDataSource {
  late Dio dio;
  RemotDataSource(this.dio) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstance.baseUrl,
      ),
    );
  }
  @override
  Future<List<MovieModel>> getNowPlay() async {
    //final response = await Dio().get(AppConstance.nowPlay);
    final response = await dio.get(AppConstance.nowPlay);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServeierException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await dio.get(AppConstance.popular);
    if (response.statusCode == 200) {
      /* response.data['results']
          .map((e) => MovieModel.fromJson(e.toJson()))
          .toList(); */
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServeierException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRate() async {
    final response = await dio.get(AppConstance.topRate);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServeierException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailesModel> getMovieDetailes(
      MovieDetailsParameters parameters) async {
    final response =
        await dio.get(AppConstance.getMovieDetailesPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailesModel.fromJson(response.data);
    } else {
      throw ServeierException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParamters parameters) async {
    final response =
        await dio.get(AppConstance.getRecommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServeierException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
