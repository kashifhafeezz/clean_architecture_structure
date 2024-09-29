import 'package:dartz/dartz.dart';
import 'package:vg_cli/core/platform/network_info.dart';
import 'package:vg_cli/core/response_error/response_error.dart';
import 'package:vg_cli/feature/home/data/remote/home_remote_data_source_repository.dart';
import 'package:vg_cli/feature/home/domain/entities/home_entity.dart';
import 'package:vg_cli/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  const HomeRepositoryImplementation({
    required this.networkInfo,
    required this.remoteDataSourceRepository,
  });

  final NetworkInfo networkInfo;
  final HomeRemoteDataSourceRepository remoteDataSourceRepository;
  @override
  Future<Either<ResponseError, HomeEntity>> fetchHomeListing() async {
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSourceRepository.getHomeListing();
        if (response != null) {
          return Right(response);
        }
        return Left(ResponseError(errorStatus: 'No data found'));
      } else {
        throw ResponseError(errorStatus: 'Internet connection lost.');
      }
    } on ResponseError catch (e) {
      return Left(e);
    }
  }
}
