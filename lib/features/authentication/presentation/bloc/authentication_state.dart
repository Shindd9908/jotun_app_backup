part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

// --------------- Login ---------------

class LoginLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthenticationState {
  final UserInfoEntity userInfo;
  final String message;

  const LoginSuccessState({required this.userInfo, required this.message});

  @override
  List<Object> get props => [userInfo, message];
}

class LoginFailState extends AuthenticationState {
  final String message;

  const LoginFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// --------------- Change password ---------------

class ChangePasswordLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class ChangePasswordSuccessState extends AuthenticationState {
  final String message;

  const ChangePasswordSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ChangePasswordFailState extends AuthenticationState {
  final String message;

  const ChangePasswordFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// --------------- Confirm account information ---------------

class ConfirmAccountLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class ConfirmAccountSuccessState extends AuthenticationState {
  final String message;

  const ConfirmAccountSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class ConfirmAccountFailState extends AuthenticationState {
  final String message;

  const ConfirmAccountFailState({required this.message});

  @override
  List<Object> get props => [message];
}

// --------------- Logout ---------------

class LogoutLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LogoutSuccessState extends AuthenticationState {
  final String message;

  const LogoutSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class LogoutFailState extends AuthenticationState {
  final String message;

  const LogoutFailState({required this.message});

  @override
  List<Object> get props => [message];
}
