import 'package:dartz/dartz.dart';
import 'package:vg_cli/core/response_error/response_error.dart';
import 'package:vg_cli/core/usecase/usecase.dart';
import 'package:vg_cli/feature/home/domain/entities/home_entity.dart';
import 'package:vg_cli/feature/home/domain/repositories/home_repository.dart';

class FetchHomeListingUseCase extends UseCase<HomeEntity, NoParams> {
  FetchHomeListingUseCase({
    required this.homeRepository,
  });
  final HomeRepository homeRepository;
  @override
  Future<Either<ResponseError, HomeEntity>> call(NoParams params) async {
    return homeRepository.fetchHomeListing();
  }
}
