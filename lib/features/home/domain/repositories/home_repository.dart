import "package:dartz/dartz.dart";
import "package:jotub_app/features/home/domain/entities/banner_entity.dart";

abstract class HomeRepository {
  Future<Either<String, List<BannerEntity>>> fetchListBanner();
}
