import 'package:dartz/dartz.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/journey/data/data_source/journey_api.dart';
import 'package:jotub_app/features/journey/data/mapper/area_mapper.dart';
import 'package:jotub_app/features/journey/data/mapper/gift_mapper.dart';
import 'package:jotub_app/features/journey/data/models/area_response.dart';
import 'package:jotub_app/features/journey/data/models/complete_area_request.dart';
import 'package:jotub_app/features/journey/data/models/gift_response.dart';
import 'package:jotub_app/features/journey/data/models/receive_gift_request.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
import 'package:jotub_app/features/journey/domain/entities/gift_entity.dart';
import 'package:jotub_app/features/journey/domain/repositories/journey_repository.dart';

class JourneyRepositoryImpl implements JourneyRepository {
  final JourneyApi journeyApi;

  const JourneyRepositoryImpl({required this.journeyApi});

  @override
  Future<Either<String, List<AreaEntity>>> fetchListArea() async {
    try {
      final result = await journeyApi.fetchListArea();
      if (result.isSuccess) {
        final data = result.getValue() as List<AreaResponse>;
        List<AreaEntity> listAreaMapper = data.map((e) => e.areaEntity).toList();
        return Right(listAreaMapper);
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> completeArea(int areaId) async {
    try {
      final result = await journeyApi.completeArea(CompleteAreaRequest(areaId: areaId));
      if (result.isSuccess) {
        return Right(result.message ?? '');
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, List<AreaCompletedEntity>>> fetchListAreaCompleted() async {
    try {
      final result = await journeyApi.fetchListAreaCompleted();
      if (result.isSuccess) {
        final data = result.getValue() as List<AreaCompletedResponse>;
        List<AreaCompletedEntity> listAreaCompletedMapper = data.map((e) => e.areaCompletedEntity).toList();
        return Right(listAreaCompletedMapper);
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, List<GiftEntity>>> fetchListGift(int type) async {
    try {
      final result = await journeyApi.fetchListGift(type);
      if (result.isSuccess) {
        final data = result.getValue() as List<GiftResponse>;
        List<GiftEntity> listGiftMapper = data.map((e) => e.giftEntity).toList();
        return Right(listGiftMapper);
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }

  @override
  Future<Either<String, String>> receivedGift(int giftId, int type) async {
    try {
      final result = await journeyApi.receivedGift(ReceiveGiftRequest(giftId: giftId, type: type));
      if (result.isSuccess) {
        return Right(result.message ?? '');
      } else {
        return Left(result.message ?? '');
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
