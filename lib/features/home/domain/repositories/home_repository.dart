import "dart:io";

import "package:dartz/dartz.dart";
import "package:jotub_app/features/authentication/domain/entities/user_authentication_entity.dart";
import "package:jotub_app/features/home/domain/entities/banner_entity.dart";

abstract class HomeRepository {
  Future<Either<String, List<BannerEntity>>> fetchListBanner();

  Future<Either<String, UserInfoEntity>> fetchUserProfile();

  Future<Either<String, String>> updateUserAvatar(File fileImageAvatar);
}
