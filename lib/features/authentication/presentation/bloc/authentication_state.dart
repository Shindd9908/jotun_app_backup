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
  final String? message;

  const LoginSuccessState({this.message});

  @override
  List<Object> get props => [message!];
}

class LoginFailState extends AuthenticationState {
  final String? message;

  const LoginFailState({this.message});

  @override
  List<Object> get props => [message!];
}

// --------------- Change password ---------------

class ChangePasswordLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class ChangePasswordSuccessState extends AuthenticationState {
  final String? message;

  const ChangePasswordSuccessState({this.message});

  @override
  List<Object> get props => [message!];
}

class ChangePasswordFailState extends AuthenticationState {
  final String? message;

  const ChangePasswordFailState({this.message});

  @override
  List<Object> get props => [message!];
}
