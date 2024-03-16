import "package:dartz/dartz.dart";
import "package:jotub_app/feature/authentication/domain/entities/user_authentication_entity.dart";

abstract class AuthenticationRepository {
  Future<Either<String, UserInfoEntity>> login({required String userCode, required String password});
}
