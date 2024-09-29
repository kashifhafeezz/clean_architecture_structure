class AppRouteNames {
  factory AppRouteNames() {
    return _singleton;
  }

  AppRouteNames._internal();

  static final AppRouteNames _singleton = AppRouteNames._internal();

  final String initialRoute = '/home';
  final String searchRoute = '/search';
  final String favoriteRoute = '/favorite';
  final String profileRoute = '/profile';
}
