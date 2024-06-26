import "package:dartz/dartz.dart";
import "package:jotub_app/core/preferences/shared_preferences_manager.dart";
import "package:jotub_app/core/services/api_service.dart";
import "package:jotub_app/features/authentication/data/data_sources/authentication_api.dart";
import "package:jotub_app/features/authentication/data/mapper/authenticaton_mapper.dart";
import "package:jotub_app/features/authentication/data/models/change_password_request.dart";
import "package:jotub_app/features/authentication/data/models/confirm_account_request.dart";
import "package:jotub_app/features/authentication/data/models/login_request.dart";
import "package:jotub_app/features/authentication/data/models/user_login_response.dart";
import "package:jotub_app/features/authentication/domain/repositories/user_authentication_repository.dart";
import "package:jotub_app/utils/constants/key_preferences.dart";

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;
  final SharedPreferencesManager sharedPreferencesManager;

  AuthenticationRepositoryImpl({required this.authenticationApi, required this.sharedPreferencesManager});

  @override
  Future<Either<String, Map<String, dynamic>>> login(String username, String password, String deviceToken, int userRole) async {
    try {
      final authentic = await authenticationApi.login(LoginRequest(username: username, password: password, deviceToken: deviceToken, role: userRole));
      if (authentic.isSuccess) {
        final data = authentic.getValue() as UserLoginResponse;
        sharedPreferencesManager.putValue(KeyPreferences.kAccessToken, data.accessToken);
        return Right({'data': data.userInfoEntity, 'message': authentic.message});
      } else {
        return Left(authentic.message!);
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> changePassword(String username, int role, String oldPassword, String password, String passwordConfirmation) async {
    try {
      final authentic = await authenticationApi.changePassword(ChangePasswordRequest(
        username: username,
        role: role,
        oldPassword: oldPassword,
        password: password,
        passwordConfirmation: passwordConfirmation,
      ));
      if (authentic.isSuccess) {
        return Right(authentic.message!);
      } else {
        return Left(authentic.message!);
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> confirmAccount(String identityCardNumber) async {
    try {
      final authentic = await authenticationApi.confirmAccount(ConfirmAccountRequest(identityCardNumber: identityCardNumber));
      if (authentic.isSuccess) {
        sharedPreferencesManager.putValue<bool>(KeyPreferences.kStatusConfirmAccountDone, true);
        return Right(authentic.message!);
      } else {
        return Left(authentic.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      final authentic = await authenticationApi.logOut();
      if (authentic.isSuccess) {
        sharedPreferencesManager.clear();
        sharedPreferencesManager.putValue<bool>(KeyPreferences.kStatusConfirmAccountDone, false);
        return Right(authentic.message!);
      } else {
        return Left(authentic.message!);
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
