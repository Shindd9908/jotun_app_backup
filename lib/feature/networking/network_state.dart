part of "network_cubit.dart";

@immutable
abstract class NetworkState {}

final class NetworkInitial extends NetworkState {}

class NetworkConnected extends NetworkState {
  @override
  String toString() => "NetworkConnected";
}

class NetworkDisconnected extends NetworkState {
  @override
  String toString() => "NetworkDisconnected";
}
