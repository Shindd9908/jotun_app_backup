part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class FetchListBannerLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class FetchListBannerSuccessState extends HomeState {
  final List<BannerEntity> listBanner;

  const FetchListBannerSuccessState({required this.listBanner});

  @override
  List<Object> get props => [listBanner];
}

class FetchListBannerFailState extends HomeState {
  final String message;

  const FetchListBannerFailState({required this.message});

  @override
  List<Object> get props => [message];
}
