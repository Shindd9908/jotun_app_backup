import 'package:dartz/dartz.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/journey/data/data_source/journey_api.dart';
import 'package:jotub_app/features/journey/data/mapper/area_mapper.dart';
import 'package:jotub_app/features/journey/data/models/area_response.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';
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
}
