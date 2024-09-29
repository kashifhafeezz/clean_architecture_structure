extension ListExtensions<T> on List<T>? {
  bool get isListNullOrEmpty => this == null && this?.isEmpty == true;
}
