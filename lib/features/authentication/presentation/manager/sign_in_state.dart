part of "sign_in_bloc.dart";

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {
  final UserInfoEntity userInfoEntity;

  const SignInSuccess({required this.userInfoEntity});
  @override
  List<Object?> get props => [userInfoEntity];
}

class SignInFailed extends SignInState {
  final String errorMessage;

  const SignInFailed({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
