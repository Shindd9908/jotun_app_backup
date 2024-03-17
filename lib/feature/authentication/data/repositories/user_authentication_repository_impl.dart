import "package:dartz/dartz.dart";
import "package:jotub_app/core/services/api_service.dart";
import "package:jotub_app/feature/authentication/data/data_sources/authentication_api.dart";
import "package:jotub_app/feature/authentication/data/mapper/authenticaton_mapper.dart";
import "package:jotub_app/feature/authentication/data/models/login_request.dart";
import "package:jotub_app/feature/authentication/data/models/login_response.dart";
import "package:jotub_app/feature/authentication/domain/entities/user_authentication_entity.dart";
import "package:jotub_app/feature/authentication/domain/repositories/user_authentication_repository.dart";

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi authenticationApi;

  AuthenticationRepositoryImpl({required this.authenticationApi});
  @override
  Future<Either<String, UserInfoEntity>> login({required String userCode, required String password}) async {
    try {
      final authentic = await authenticationApi.login(LoginRequest(userCode: userCode, password: password));
      if (authentic.isSuccess) {
        final data = authentic.getValue() as LoginResponse;
        return Right(data.userInfoEntity);
      } else {
        return Left(authentic.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
