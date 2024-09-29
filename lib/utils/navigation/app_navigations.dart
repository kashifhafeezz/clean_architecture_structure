import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vg_cli/utils/extensions/string_extensions.dart';
import 'package:vg_cli/utils/navigation/app_route_names.dart';

class AppNavigation {
  factory AppNavigation() {
    return _singleton;
  }

  AppNavigation._internal();

  static final AppNavigation _singleton = AppNavigation._internal();

  void navigateBack({required BuildContext context, dynamic data}) {
    context.pop(data);
  }

  void navigateFromHomeToSectionViewAllList({required BuildContext context}) {
    context.pushNamed(AppRouteNames().initialRoute.convertRouteToName);
  }
}
