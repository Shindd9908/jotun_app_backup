import 'package:dartz/dartz.dart';
import 'package:jotub_app/features/journey/domain/entities/area_entity.dart';

abstract class JourneyRepository {
  Future<Either<String, List<AreaEntity>>> fetchListArea();
}
