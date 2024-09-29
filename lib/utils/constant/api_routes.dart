class ApiRoutes {
  factory ApiRoutes() {
    return _singleton;
  }

  ApiRoutes._internal();

  static final ApiRoutes _singleton = ApiRoutes._internal();
  static const String home = '';
}
