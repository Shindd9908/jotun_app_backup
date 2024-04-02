import 'package:dartz/dartz.dart';
import 'package:jotub_app/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<String, NotificationDataEntity>> getListNotificationData();
}
