import 'package:dartz/dartz.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/domain/entities/gift_entity.dart';

abstract class JourneyRepository {
  Future<Either<String, List<AreaEntity>>> fetchListArea();

  Future<Either<String, String>> completeArea(int areaId);

  Future<Either<String, List<AreaCompletedEntity>>> fetchListAreaCompleted();

  Future<Either<String, List<GiftEntity>>> fetchListGift(int type);

  Future<Either<String, String>> receivedGift(int giftId, int type);
}
