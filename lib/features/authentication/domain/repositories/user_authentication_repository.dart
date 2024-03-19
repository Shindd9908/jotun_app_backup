import "package:dartz/dartz.dart";
import "package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart";

abstract class AuthenticationRepository {
  Future<Either<String, UserInfoEntity>> login({
    required String username,
    required String password,
    required int userRole,
  });
}
