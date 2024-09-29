import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vg_cli/core/usecase/usecase.dart';
import 'package:vg_cli/feature/home/domain/entities/home_entity.dart';
import 'package:vg_cli/feature/home/domain/use_cases/fetch_home_listing_use_case.dart';

part 'home_listing_event.dart';
part 'home_listing_state.dart';

class HomeListingBloc extends Bloc<FetchHomeListingEvent, HomeListingState> {
  HomeListingBloc({required this.useCase})
      : super(
          const HomeListingInitial(
            homeEntity: HomeEntity(id: 0, title: '', subTitle: '', image: ''),
          ),
        ) {
    on<FetchHomeListingEvent>(_fetchHomeListing);
  }

  final FetchHomeListingUseCase useCase;

  Future<void> _fetchHomeListing(
    FetchHomeListingEvent event,
    Emitter<HomeListingState> emit,
  ) async {
    emit(
      const HomeListingLoading(
        homeEntity: HomeEntity(id: 0, title: '', subTitle: '', image: ''),
      ),
    );

    final response = await useCase.call(NoParams());

    response.fold(
      (error) => emit(
        HomeListingFailure(
          homeEntity:
              const HomeEntity(id: 0, title: '', subTitle: '', image: ''),
          errorMessage: error.errorStatus,
        ),
      ),
      (success) => emit(HomeListingLoaded(homeEntity: success)),
    );
  }
}

// class UnitDetailBloc extends Bloc<UnitDetailEvent, UnitDetailState> {
//   UnitDetailBloc({required this.fetchUnitDetailUseCase})
//       : super(
//     UnitDetailInitial(
//       unitDetailEntity: const UnitDetailEntity(),
//       unitDetailBaseScreen: UnitDetailBaseScreen(
//         unitDetailEntity: const UnitDetailEntity(),
//       ),
//     ),
//   ) {
//     on<FetchUnitDetailEvent>(_fetchUnitDetail);
//   }
//
//   final FetchUnitDetailUseCase fetchUnitDetailUseCase;
//
//   Future<void> _fetchUnitDetail(
//       FetchUnitDetailEvent event,
//       Emitter<UnitDetailState> emit,
//       ) async {
//     emit(
//       UnitDetailLoading(
//         unitDetailEntity: state.unitDetailEntity,
//         unitDetailBaseScreen: state.unitDetailBaseScreen,
//       ),
//     );
//
//     final response = await fetchUnitDetailUseCase.call(event.requestModel);
//
//     response.fold(
//           (error) => emit(
//         UnitDetailFailure(
//           unitDetailEntity: state.unitDetailEntity,
//           unitDetailBaseScreen: state.unitDetailBaseScreen,
//           errorMessage: error.errorStatus,
//         ),
//       ),
//           (success) => emit(
//         UnitDetailLoaded(
//           unitDetailEntity: success,
//           unitDetailBaseScreen: UnitDetailBaseScreen(unitDetailEntity: success),
//         ),
//       ),
//     );
//   }
// }
