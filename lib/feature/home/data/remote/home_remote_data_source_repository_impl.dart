import 'package:vg_cli/core/response_error/response_error.dart';
import 'package:vg_cli/feature/home/data/models/home_model.dart';
import 'package:vg_cli/feature/home/data/remote/home_remote_data_source_repository.dart';
import 'package:vg_cli/utils/client/client.dart';

class HomeRemoteDataSourceRepositoryImplementation
    implements HomeRemoteDataSourceRepository {
  HomeRemoteDataSourceRepositoryImplementation({
    required this.clientConfig,
  });
  final ClientConfig clientConfig;
  @override
  Future<HomeModel?> getHomeListing() async {
    try {
      return const HomeModel(
        id: 1,
        title: 'Title',
        subTitle: 'Subtitle',
        image: 'image',
      );
    } catch (e) {
      throw ResponseError(errorStatus: e.toString());
    }
  }
}
