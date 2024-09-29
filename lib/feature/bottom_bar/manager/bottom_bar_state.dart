part of 'bottom_bar_cubit.dart';

sealed class BottomBarState {
  const BottomBarState({
    required this.currentIndex,
  });

  final int currentIndex;
}

final class BottomBarIndexChanged extends BottomBarState {
  const BottomBarIndexChanged({required super.currentIndex});
}
