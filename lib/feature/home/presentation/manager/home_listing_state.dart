part of 'home_listing_bloc.dart';

sealed class HomeListingState extends Equatable {
  const HomeListingState({required this.homeEntity});

  final HomeEntity homeEntity;
}

final class HomeListingInitial extends HomeListingState {
  const HomeListingInitial({required super.homeEntity});
  @override
  List<Object> get props => [homeEntity];
}

final class HomeListingLoading extends HomeListingState {
  const HomeListingLoading({required super.homeEntity});
  @override
  List<Object> get props => [homeEntity];
}

final class HomeListingLoaded extends HomeListingState {
  const HomeListingLoaded({required super.homeEntity});
  @override
  List<Object> get props => [homeEntity];
}

final class HomeListingFailure extends HomeListingState {
  const HomeListingFailure({
    required super.homeEntity,
    required this.errorMessage,
  });

  final String errorMessage;
  @override
  List<Object> get props => [homeEntity, errorMessage];
}

// sealed class UnitDetailState extends Equatable {
//   const UnitDetailState({
//     required this.unitDetailEntity,
//     required this.unitDetailBaseScreen,
//   });
//   final UnitDetailEntity unitDetailEntity;
//   final UnitDetailBaseScreen unitDetailBaseScreen;
// }
//
// final class UnitDetailInitial extends UnitDetailState {
//   const UnitDetailInitial(
//       {required super.unitDetailEntity, required super.unitDetailBaseScreen});
//
//   @override
//   List<Object> get props => [unitDetailEntity, unitDetailBaseScreen];
// }
//
// final class UnitDetailLoading extends UnitDetailState {
//   const UnitDetailLoading(
//       {required super.unitDetailEntity, required super.unitDetailBaseScreen});
//
//   @override
//   List<Object> get props => [unitDetailEntity, unitDetailBaseScreen];
// }
//
// final class UnitDetailLoaded extends UnitDetailState {
//   const UnitDetailLoaded(
//       {required super.unitDetailEntity, required super.unitDetailBaseScreen});
//
//   @override
//   List<Object> get props => [unitDetailEntity, unitDetailBaseScreen];
// }
//
// final class UnitDetailFailure extends UnitDetailState {
//   const UnitDetailFailure({
//     required super.unitDetailEntity,
//     required this.errorMessage,
//     required super.unitDetailBaseScreen,
//   });
//   final String errorMessage;
//   @override
//   List<Object> get props =>
//       [unitDetailEntity, errorMessage, unitDetailBaseScreen];
// }
