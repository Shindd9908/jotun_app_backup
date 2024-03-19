part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String? name;
  final String? password;

  const LoginEvent({this.name, this.password});

  @override
  List<Object?> get props => [name, password];
}

class ChangePasswordEvent extends AuthenticationEvent {
  final String? name;
  final String? currentPassword;
  final String? newPassword;
  final String? confirmNewPassword;

  const ChangePasswordEvent({
    this.name,
    this.currentPassword,
    this.newPassword,
    this.confirmNewPassword,
  });

  @override
  List<Object?> get props => [
        name,
        currentPassword,
        newPassword,
        confirmNewPassword,
      ];
}
