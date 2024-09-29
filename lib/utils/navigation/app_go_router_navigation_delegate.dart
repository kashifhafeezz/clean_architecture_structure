import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_cli/feature/bottom_bar/pages/bottom_bar_view.dart';
import 'package:vg_cli/feature/home/presentation/pages/home_page_view.dart';
import 'package:vg_cli/utils/navigation/app_route_names.dart';

class AppGoRouterNavigationDelegate {
  factory AppGoRouterNavigationDelegate() {
    return _singleton;
  }

  AppGoRouterNavigationDelegate._internal();

  static final AppGoRouterNavigationDelegate _singleton =
      AppGoRouterNavigationDelegate._internal();

  static final _routeNames = AppRouteNames();
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellHomeKey = GlobalKey<NavigatorState>();
  static final _shellSearchKey = GlobalKey<NavigatorState>();
  static final _shellFavoriteKey = GlobalKey<NavigatorState>();
  static final _profileKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: _routeNames.initialRoute,
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MaterialPage(
            child: BottomBarView(navigationShell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellHomeKey,
            routes: [
              GoRoute(
                path: _routeNames.initialRoute,
                name: _routeNames.initialRoute,
                pageBuilder: (ctx, state) {
                  return const MaterialPage(
                    child: HomePageView(),
                  );
                },
                routes: [
                  // GoRoute(
                  //   path: _routeNames.sectionsRoute.convertRouteToName,
                  //   name: _routeNames.sectionsRoute.convertRouteToName,
                  //   pageBuilder: (context, state) => CustomTransitionPage<void>(
                  //     key: state.pageKey,
                  //     child: const SectionsView(),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) =>
                  //         FadeTransition(opacity: animation, child: child),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellSearchKey,
            routes: [
              GoRoute(
                path: _routeNames.searchRoute,
                name: _routeNames.searchRoute,
                pageBuilder: (context, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellFavoriteKey,
            routes: [
              GoRoute(
                path: _routeNames.favoriteRoute,
                name: _routeNames.favoriteRoute,
                pageBuilder: (context, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileKey,
            routes: [
              GoRoute(
                path: _routeNames.profileRoute,
                name: _routeNames.profileRoute,
                pageBuilder: (context, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: const Scaffold(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
