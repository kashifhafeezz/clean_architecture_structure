import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:vg_cli/core/localization/cubit/locale_cubit.dart';
import 'package:vg_cli/core/platform/check_internet_connection/bloc/check_internet_connection_bloc.dart';
import 'package:vg_cli/core/platform/network_info.dart';
import 'package:vg_cli/feature/bottom_bar/manager/bottom_bar_cubit.dart';
import 'package:vg_cli/feature/home/data/remote/home_remote_data_source_repository.dart';
import 'package:vg_cli/feature/home/data/remote/home_remote_data_source_repository_impl.dart';
import 'package:vg_cli/feature/home/data/repositories/home_repository_impl.dart';
import 'package:vg_cli/feature/home/domain/repositories/home_repository.dart';
import 'package:vg_cli/feature/home/domain/use_cases/fetch_home_listing_use_case.dart';
import 'package:vg_cli/feature/home/presentation/manager/home_listing_bloc.dart';
import 'package:vg_cli/utils/client/client.dart';

final sl = GetIt.instance;

void manageDependencies() {
  _manageBloc();
  _manageUseCases();
  _manageRepositories();
  _manageExternalDataSources();
}

void _manageBloc() {
  sl
    ..registerFactory<CheckInternetConnectionBloc>(
      CheckInternetConnectionBloc.new,
    )
    ..registerLazySingleton<LocaleCubit>(LocaleCubit.new)
    ..registerLazySingleton<BottomBarCubit>(BottomBarCubit.new)
    ..registerFactory<HomeListingBloc>(() => HomeListingBloc(useCase: sl()));
}

void _manageUseCases() {
  sl.registerLazySingleton(() => FetchHomeListingUseCase(homeRepository: sl()));
}

void _manageRepositories() {
  sl
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(
        networkInfo: sl(),
        remoteDataSourceRepository: sl(),
      ),
    )
    ..registerLazySingleton<HomeRemoteDataSourceRepository>(
      () => HomeRemoteDataSourceRepositoryImplementation(
        clientConfig: sl(),
      ),
    );
}

void _manageExternalDataSources() {
  sl.registerLazySingleton<ClientConfig>(ClientConfig.new);

  final connectivity = Connectivity();

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(networkConnectionCheck: connectivity),
  );
}
