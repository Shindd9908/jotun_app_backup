import "package:bloc/bloc.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:meta/meta.dart";

part "network_state.dart";

class NetworkCubit extends Cubit<NetworkState> {
  static final NetworkCubit _singleton = NetworkCubit._internal();

  factory NetworkCubit() {
    return _singleton;
  }

  NetworkCubit._internal() : super(NetworkConnected()) {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(NetworkDisconnected());
      } else {
        emit(NetworkConnected());
      }
    });
  }
}
