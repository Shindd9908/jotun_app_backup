import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart';
import 'package:jotub_app/features/authentication/domain/repositories/user_authentication_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.authenticationRepository}) : super(AuthenticationInitial()) {
    on<LoginEvent>(_login);
    on<ChangePasswordEvent>(_changePassword);
    on<ConfirmAccountEvent>(_confirmAccount);
    on<LogoutEvent>(_logout);
  }

  final AuthenticationRepository authenticationRepository;

  Future<void> _login(LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());
    final userData = await authenticationRepository.login(event.name, event.password, event.deviceToken, event.roleUser);
    userData.fold(
      (l) => emit(LoginFailState(message: l)),
      (r) => emit(LoginSuccessState(userInfo: r['data'], message: r['message'])),
    );
  }

  Future<void> _changePassword(ChangePasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(ChangePasswordLoadingState());
    final userData = await authenticationRepository.changePassword(event.username, event.role, event.oldPassword, event.password, event.passwordConfirmation);
    userData.fold(
      (l) => emit(ChangePasswordFailState(message: l)),
      (r) => emit(ChangePasswordSuccessState(message: r)),
    );
  }

  Future<void> _confirmAccount(ConfirmAccountEvent event, Emitter<AuthenticationState> emit) async {
    emit(ConfirmAccountLoadingState());
    final userData = await authenticationRepository.confirmAccount(event.identityCardNumber);
    userData.fold(
      (l) => emit(ConfirmAccountFailState(message: l)),
      (r) => emit(ConfirmAccountSuccessState(message: r)),
    );
  }

  Future<void> _logout(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(LogoutLoadingState());
    final userData = await authenticationRepository.logout();
    userData.fold(
      (l) => emit(LogoutFailState(message: l)),
      (r) => emit(LogoutSuccessState(message: r)),
    );
  }
}
