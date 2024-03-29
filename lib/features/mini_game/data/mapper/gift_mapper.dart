import 'package:jotub_app/features/mini_game/data/models/gift_response.dart';
import 'package:jotub_app/features/mini_game/domain/entities/gift_entity.dart';

extension GiftMapExt on GiftResponse {
  GiftEntity get giftEntity => GiftEntity(
    giftId: giftId,
    giftUrl: giftUrl,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
