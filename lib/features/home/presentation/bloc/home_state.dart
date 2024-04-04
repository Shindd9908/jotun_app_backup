part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

// ---------------- Fetch list banner ----------------------

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

// ---------------- Fetch user profile ----------------------

class FetchUserProfileLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class FetchUserProfileSuccessState extends HomeState {
  final UserInfoEntity userInfo;

  const FetchUserProfileSuccessState({required this.userInfo});

  @override
  List<Object> get props => [userInfo];
}

class FetchUserProfileFailState extends HomeState {
  final String message;

  const FetchUserProfileFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// ---------------- Fetch user profile ----------------------

class UpdateUserAvatarLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class UpdateUserAvatarSuccessState extends HomeState {
  final String message;

  const UpdateUserAvatarSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateUserAvatarFailState extends HomeState {
  final String message;

  const UpdateUserAvatarFailState({required this.message});

  @override
  List<Object> get props => [message];
}
