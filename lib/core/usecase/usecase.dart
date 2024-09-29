import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vg_cli/core/response_error/response_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ResponseError, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
