import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:vg_cli/core/localization/l10n/l10n.dart';
import 'package:vg_cli/utils/constant/app_snack_bar.dart';
import 'package:vg_cli/utils/navigation/app_go_router_navigation_delegate.dart';

part 'check_internet_connection_event.dart';
part 'check_internet_connection_state.dart';

class CheckInternetConnectionBloc
    extends Bloc<CheckInternetConnectionEvent, CheckInternetConnectionState> {
  CheckInternetConnectionBloc() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  void _observe(
      NetworkObserve event, Emitter<CheckInternetConnectionState> emit) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        if (AppGoRouterNavigationDelegate.rootNavigatorKey.currentContext !=
            null) {
          AppSnackBar().showErrorSnackBar(
              context: AppGoRouterNavigationDelegate
                  .rootNavigatorKey.currentContext!,
              errorMessage: AppGoRouterNavigationDelegate.rootNavigatorKey
                      .currentContext?.l10n.internetFailureMessage ??
                  "It seems that your device is not connected to the network.Please check your internet connectivity or try again later.");
        }
        add(NetworkNotify());
      } else {
        if (AppGoRouterNavigationDelegate.rootNavigatorKey.currentContext !=
            null) {
          AppSnackBar().showSuccessSnackBar(
              context: AppGoRouterNavigationDelegate
                  .rootNavigatorKey.currentContext!,
              successMessage: AppGoRouterNavigationDelegate.rootNavigatorKey
                      .currentContext?.l10n.internetSuccessMessage ??
                  "Internet connection has been restored!");
        }
        add(NetworkNotify(isConnected: true));
      }
    });
  }

  void _notifyStatus(
      NetworkNotify event, Emitter<CheckInternetConnectionState> emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
