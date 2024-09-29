import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isDarkTheme => theme.colorScheme.brightness == Brightness.dark;
}
