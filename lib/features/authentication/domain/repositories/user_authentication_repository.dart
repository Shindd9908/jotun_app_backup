import "package:dartz/dartz.dart";

abstract class AuthenticationRepository {
  Future<Either<String, Map<String, dynamic>>> login(String username, String password, int userRole);

  Future<Either<String, String>> changePassword(String username, int role, String oldPassword, String password, String passwordConfirmation);

  Future<Either<String, String>> confirmAccount(String identityCardNumber);
}
