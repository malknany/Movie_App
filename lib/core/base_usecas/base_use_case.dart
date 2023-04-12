import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failer.dart';

// دى كلاس معموله علشان محدش يجي جمب اليوز كاس ويغير في اسمها
abstract class BaseUseCase<T, Paramters> {
  Future<Either<Failuer, T>> call(Paramters paramters);
}

class NoParamters extends Equatable {
  const NoParamters();
  
  @override
  List<Object?> get props => [];

}
