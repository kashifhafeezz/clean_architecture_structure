part of 'check_internet_connection_bloc.dart';
abstract class CheckInternetConnectionState {}

class NetworkInitial extends CheckInternetConnectionState {}

class NetworkSuccess extends CheckInternetConnectionState {}

class NetworkFailure extends CheckInternetConnectionState {}