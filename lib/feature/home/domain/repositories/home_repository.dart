import 'package:dartz/dartz.dart';
import 'package:vg_cli/core/response_error/response_error.dart';
import 'package:vg_cli/feature/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<ResponseError, HomeEntity>> fetchHomeListing();
}
