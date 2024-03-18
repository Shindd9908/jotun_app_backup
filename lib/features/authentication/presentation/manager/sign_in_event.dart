part of "sign_in_bloc.dart";

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInWithEmailEvent extends SignInEvent {
  final String userCode;
  final String password;

  const SignInWithEmailEvent({required this.userCode, required this.password});

  @override
  List<Object?> get props => [userCode, password];
}
