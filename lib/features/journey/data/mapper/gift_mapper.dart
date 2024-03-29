import 'package:jotub_app/features/journey/data/models/gift_response.dart';
import 'package:jotub_app/features/journey/domain/entities/gift_entity.dart';

extension GiftMapExt on GiftResponse {
  GiftEntity get giftEntity => GiftEntity(
        giftId: giftId,
        giftURL: giftURL,
        content: createdAt,
        type: type,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
