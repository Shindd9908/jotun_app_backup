import "package:jotub_app/features/home/data/models/banner_response.dart";
import "package:jotub_app/features/home/domain/entities/banner_entity.dart";

extension BannerMapExt on BannerResponse {
  BannerEntity get bannerEntity => BannerEntity(
    bannerId: bannerId,
    bannerURL: bannerURL,
    createAt: createdAt,
    updateAt: updateAt,
  );
}
