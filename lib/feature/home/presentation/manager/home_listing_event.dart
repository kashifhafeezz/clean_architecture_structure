part of 'home_listing_bloc.dart';

sealed class HomeListingEvent extends Equatable {
  const HomeListingEvent();
}

final class FetchHomeListingEvent extends HomeListingEvent {
  // add request param  here
  @override
  List<Object?> get props => [];
}
