part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchListBannerEvent extends HomeEvent {
  const FetchListBannerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}