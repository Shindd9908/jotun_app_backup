import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:bloc/bloc.dart";
import "package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart";
import "package:jotub_app/features/authentication/domain/repositories/user_authentication_repository.dart";

part "sign_in_event.dart";

part "sign_in_state.dart";

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository authenticationRepository;

  SignInBloc({required this.authenticationRepository}) : super(SignInInitial()) {
    on<SignInWithEmailEvent>(_signInWithEmailToState);
  }

  Future<void> _signInWithEmailToState(SignInWithEmailEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading());
      final userData = await authenticationRepository.login(
        username: "BIEMPaQ15G",
        password: "0961783723",
        userRole: 0,
      );
      userData.fold(
        (l) => emit(SignInFailed(errorMessage: l)),
        (r) => emit(SignInSuccess(userInfoEntity: r)),
      );
    } catch (e) {
      emit(SignInFailed(errorMessage: e.toString()));
    }
  }
}
