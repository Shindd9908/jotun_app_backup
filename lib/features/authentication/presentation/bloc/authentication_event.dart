part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String? name;
  final String? password;
  final int? roleUser;

  const LoginEvent({required this.name, required this.password, required this.roleUser});

  @override
  List<Object?> get props => [name, password, roleUser];
}

class ChangePasswordEvent extends AuthenticationEvent {
  final String? username;
  final int? role;
  final String? oldPassword;
  final String? password;
  final String? passwordConfirmation;

  const ChangePasswordEvent({required this.username, required this.role, required this.oldPassword, required this.password, required this.passwordConfirmation});

  @override
  List<Object?> get props => [username, role, oldPassword, password, passwordConfirmation];
}

class ConfirmAccountEvent extends AuthenticationEvent {
  final String? identityCardNumber;

  const ConfirmAccountEvent({required this.identityCardNumber});

  @override
  List<Object?> get props => [identityCardNumber];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
