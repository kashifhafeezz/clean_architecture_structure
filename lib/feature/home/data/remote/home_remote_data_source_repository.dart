import 'package:vg_cli/feature/home/data/models/home_model.dart';

abstract class HomeRemoteDataSourceRepository {
  Future<HomeModel?> getHomeListing();
}
