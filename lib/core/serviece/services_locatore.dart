import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../movie_app/domain/usecases/get_movie_detailes_use_case.dart';
import '../../movie_app/domain/usecases/get_popular.dart';
import '../../movie_app/domain/usecases/get_recommendation.dart';
import '../../movie_app/domain/usecases/get_top_rate.dart';
import '../../movie_app/presentation/bloc/bloc/movie_detailes_bloc.dart';
import '../../movie_app/data/datasources/remot_data_source.dart';
import '../../movie_app/data/repositories/movie_repo.dart';
import '../../movie_app/domain/repositories/base_movie_repo.dart';
import '../../movie_app/domain/usecases/get_now_playing.dart';
import '../../movie_app/presentation/bloc/movie_bloc.dart';

final sl = GetIt.instance;

class ServiecesLocator {
  void init() {
    //sl.registerSingleton(MovieRepo(sl()));

    // bloc
    sl.registerFactory(() => MovieBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailesBloc(sl(), sl()));

    // repo
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));

    // datasource
    sl.registerLazySingleton<BaseRemotDataSource>(
        () => RemotDataSource(creatAndSutUpDio()));

    // usecase
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRateMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetailesUseCase(
          baseMovieRepo: sl(),
        ));
    sl.registerLazySingleton(
      () => GetRecommendationUseCase(
        baseMovieRepo: sl(),
      ),
    );
  }

  Dio creatAndSutUpDio() {
    Dio dio = Dio();

    dio
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20);

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      request: true,
    ));

    return dio;
  }
}
