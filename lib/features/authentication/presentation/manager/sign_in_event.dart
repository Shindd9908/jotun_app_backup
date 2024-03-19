part of "sign_in_bloc.dart";

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInWithEmailEvent extends SignInEvent {
  final String username;
  final String password;
  final int roleUser;

  const SignInWithEmailEvent({
    required this.username,
    required this.password,
    required this.roleUser,
  });

  @override
  List<Object?> get props => [username, password, username];
}
