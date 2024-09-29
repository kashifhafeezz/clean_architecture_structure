import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_cli/core/localization/l10n/l10n.dart';
import 'package:vg_cli/feature/bottom_bar/manager/bottom_bar_cubit.dart';
import 'package:vg_cli/gen/assets.gen.dart';
import 'package:vg_cli/utils/constant/app_constants.dart';
import 'package:vg_cli/utils/dependency_injection/di_container.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  late BottomBarCubit bottomBarCubit;
  @override
  void initState() {
    super.initState();
    bottomBarCubit = sl.get<BottomBarCubit>();
  }

  @override
  void dispose() {
    bottomBarCubit.close();
    super.dispose();
  }

  double size = 26;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bottomBarCubit,
      child: BlocBuilder<BottomBarCubit, BottomBarState>(
        buildWhen: (prev, current) => current.currentIndex != prev.currentIndex,
        builder: (ctx, state) {
          return Scaffold(
            body: widget.navigationShell,
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (index) => bottomBarCubit.changeTab(
                index,
                context: ctx,
              ),
              selectedIndex: state.currentIndex,
              indicatorColor: AppColors().appTransparentColor,
              backgroundColor: AppColors().appWhiteColor,
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.asset(
                    Assets.icons.home,
                    height: size,
                    width: size,
                    color: AppColors().appGreyColor,
                  ),
                  label: ctx.l10n.bottom_bar_home_title,
                  selectedIcon: SvgPicture.asset(
                    Assets.icons.home,
                    height: size,
                    width: size,
                  ),
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    Assets.icons.search,
                    height: size,
                    width: size,
                    color: AppColors().appGreyColor,
                  ),
                  label: ctx.l10n.bottom_bar_search_title,
                  selectedIcon: SvgPicture.asset(
                    Assets.icons.search,
                    height: size,
                    width: size,
                  ),
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    Assets.icons.favorite,
                    height: size,
                    width: size,
                    color: AppColors().appGreyColor,
                  ),
                  label: ctx.l10n.bottom_bar_favorite_title,
                  selectedIcon: SvgPicture.asset(
                    Assets.icons.favorite,
                    height: size,
                    width: size,
                  ),
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    Assets.icons.profile,
                    height: size,
                    width: size,
                    color: AppColors().appGreyColor,
                  ),
                  label: ctx.l10n.bottom_bar_profile_title,
                  selectedIcon: SvgPicture.asset(
                    Assets.icons.profile,
                    height: size,
                    width: size,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
