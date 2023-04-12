import 'package:dartz/dartz.dart';
import '../../../core/base_usecas/base_use_case.dart';
import '../../../core/error/failer.dart';
import '../entities/movie.dart';
import '../repositories/base_movie_repo.dart';

class GetTopRateMovies extends BaseUseCase<List<Movie>,NoParamters>{
  final BaseMovieRepo baseMovieRepo;
  GetTopRateMovies(this.baseMovieRepo);

  @override
  Future<Either<Failuer,List<Movie>>> call(paramters) async {
    return await baseMovieRepo.getTopRate();
  }
}
