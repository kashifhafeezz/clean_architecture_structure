import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_cli/utils/navigation/app_route_names.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(const BottomBarIndexChanged(currentIndex: 0));

  int currentIndex = 0;

  void changeTab(int index, {required BuildContext context}) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        context.go(AppRouteNames().initialRoute);
      case 1:
        context.go(AppRouteNames().searchRoute);
      case 2:
        context.go(AppRouteNames().favoriteRoute);
      case 3:
        context.go(AppRouteNames().profileRoute);
    }
    emit(BottomBarIndexChanged(currentIndex: currentIndex));
  }
}
