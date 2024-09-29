part of 'check_internet_connection_bloc.dart';

abstract class CheckInternetConnectionEvent {}

class NetworkObserve extends CheckInternetConnectionEvent {}

class NetworkNotify extends CheckInternetConnectionEvent {
  NetworkNotify({this.isConnected = false});
  final bool isConnected;
}
