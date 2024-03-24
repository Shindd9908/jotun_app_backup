part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchListBannerEvent extends HomeEvent {
  const FetchListBannerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchUserProfileEvent extends HomeEvent {
  const FetchUserProfileEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
