import 'package:dartz/dartz.dart';
import 'package:jotub_app/core/services/api_service.dart';
import 'package:jotub_app/features/notification/data/data_sources/notification_api.dart';
import 'package:jotub_app/features/notification/data/mapper/notification_mapper.dart';
import 'package:jotub_app/features/notification/data/models/response/notification_data_model.dart';
import 'package:jotub_app/features/notification/domain/entities/notification_entity.dart';
import 'package:jotub_app/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationApi notificationApi;

  NotificationRepositoryImpl({required this.notificationApi});
  @override
  Future<Either<String, NotificationDataEntity>> getListNotificationData() async {
    try {
      final result = await notificationApi.getListNotification();
      if (result.isSuccess) {
        final data = result.data as NotificationDataModel;
        return Right(data.notificationEntity);
      } else {
        return Left(result.message ?? "");
      }
    } catch (error) {
      return ApiServices.handleApiError(error);
    }
  }
}
