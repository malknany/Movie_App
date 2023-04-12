// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failuer extends Equatable {
  final String mas;
  const Failuer({
    required this.mas,
  });
  

  @override
  List<Object> get props => [mas];
}

class ServerFailuer extends Failuer {
  const ServerFailuer({required super.mas});
}
