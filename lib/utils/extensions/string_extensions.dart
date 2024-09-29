import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get convertRouteToName => replaceAll('/', '');

  String get formatDate {
    final DateTime dt = DateTime.parse(this);
    return DateFormat('dd-MMM-yyy').format(dt);
  }

  String get formatDateNumbers {
    final DateTime dt = DateTime.parse(this);
    return DateFormat('dd-MM-yyyy').format(dt);
  }

  String get formatDateAndTime {
    final DateTime dt = DateTime.parse(this);
    return DateFormat('yy/MM/dd').add_jm().format(dt);
  }
}

extension StringNullableExtensions on String? {
  bool get isTextNullOrEmpty => this == null && this?.isEmpty == true;
}
